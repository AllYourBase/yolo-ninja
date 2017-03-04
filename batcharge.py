#!/usr/bin/env python
# coding=UTF-8

import math, subprocess
from decimal import *
getcontext().rounding=ROUND_HALF_DOWN

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
output = p.communicate()[0]

o_max  = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
o_cur  = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]
o_chg  = [l for l in output.splitlines() if 'IsCharging' in l][0]
o_time = [l for l in output.splitlines() if 'TimeRemaining' in l][0]

b_max = float(o_max.rpartition('=')[-1].strip())
b_cur = float(o_cur.rpartition('=')[-1].strip())
b_chg = (
	True if o_chg.rpartition('=')[-1].strip() == 'Yes'
	else False
)
b_time = int(o_time.rpartition('=')[-1].strip())

charge_ratio = (b_cur / b_max)
charge_pct = int(round(100 * charge_ratio, 0))

# modify this for a longer/shorter charge graph
graph_blocks = 10

# filled_blocks = int(math.ceil(charge_threshold * (graph_blocks / 10.0))) * u'▸'
# empty_blocks = (graph_blocks - len(filled_blocks)) * u'▹'

# '\u2588' = full block - uses entire letterform block
# '\u26a1' = lightning bolt - thin stroke, difficult to make out
# '\u220e' = smaller block - discontiguous, slightly low of center
# '\u25a0' = other block - contiguous, not as tall as full block, sits low of center
# '\u25cf' = large solid circle
# u'\U0001f50b' = battery icon

filled_blocks = int(round((charge_ratio * graph_blocks), 0)) * u'\u25a0'
empty_blocks = int(graph_blocks - len(filled_blocks)) * u'\u25a0'

color_green = '%{$fg[green]%}'
color_yellow = '%{$fg[yellow]%}'
color_red = '%{$fg[red]%}'
color_black = '%{$fg[black]%}'
color_reset = '%{$reset_color%}'

color_empty = color_black
color_filled = (
    color_green if len(filled_blocks) > 6
    else color_yellow if len(filled_blocks) > 2
    else color_red
)

pct_string = (color_filled + str(charge_pct) + '%%' + color_reset).encode('utf-8')

battery_bar = (color_filled + filled_blocks + color_empty + empty_blocks + color_reset).encode('utf-8')
import sys

battery_bar = pct_string + ' ' + battery_bar
sys.stdout.write(battery_bar)
