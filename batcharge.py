#!/usr/bin/env python
# coding=UTF-8

import math, subprocess, re, sys

p = subprocess.Popen(['pmset', '-g', 'batt'], stdout=subprocess.PIPE)
output = p.communicate()[0]

# sample output
# "Now drawing from 'AC Power'\n -InternalBattery-0 (id=4522083)\t47%; charging; 2:00 remaining present: true\n"
# "Now drawing from 'Battery Power'\n -InternalBattery-0 (id=4522083)\t67%; charging; (no estimate) remaining present: true\n"

lines = output.splitlines()
source, data = lines[0], lines[1]

source = re.sub('^Now\ drawing\ from\ |\x27', '', source)
pct, state, time = [x.strip() for x in data.split("\t")[-1].split(';')]

time = re.search('\d+[:]\d{2}', time)
time = '-:--' if (not time or time.group() == '0:00') else time.group()

charge_pct = int(re.sub('[%]', '', pct))
charge_ratio = charge_pct / 100.0

# modify this for a longer/shorter charge graph
graph_blocks = 10

# Unicode sequences for possible graphical characters
# '\u26a1' = lightning bolt - thin stroke, difficult to see
# '\u25a0' = medium block - contiguous
#  u'\U0001f50b' = battery icon
# '\u2622' - radioactive symbol

filled_blocks = int(round((charge_ratio * graph_blocks), 0)) * u'\u25a0'
empty_blocks = int(graph_blocks - len(filled_blocks)) * u'\u25a0'

color_green = '%{$fg[green]%}'
color_yellow = '%{$fg[yellow]%}'
color_red = '%{$fg[red]%}'
color_blink_red = '\e[5;31m'
color_black = '%{$fg[black]%}'
color_reset = '%{$reset_color%}'
color_empty = color_black
color_filled = (
    color_green if charge_pct > 60
    else color_yellow if charge_pct > 20
    else color_blink_red if charge_pct < 10 and source == 'Battery Power'
    else color_red
)

pct_string = str(charge_pct) + '%%'
chg_status = {
	'AC Power': color_green + '/'.join(['+', pct_string, time]),
	'Battery Power': color_filled  + '/'.join(['-', pct_string, time])
}
battery_bar = (color_filled + filled_blocks + color_reset + color_empty + empty_blocks)
battery_status = (chg_status[source] + ' ' + battery_bar + color_reset).encode('utf-8')

sys.stdout.write(battery_status)
