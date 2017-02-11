#!/usr/bin/env python
# coding=UTF-8

import math, subprocess

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
output = p.communicate()[0]

o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]

b_max = float(o_max.rpartition('=')[-1].strip())
b_cur = float(o_cur.rpartition('=')[-1].strip())

charge = b_cur / b_max
charge_threshold = int(math.ceil(10 * charge))

# Output

total_slots, slots = 10, []
# filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'▸'
# '\u2588' = full block - uses entire letterform block
# '\u26a1' = lightning bolt - thin stroke, difficult to make out
# '\u220e' = smaller block - discontiguous, slightly low of center
# '\u25a0' = other block - contiguous, not as tall as full block, sits low of center
# '\u25cf' = large solid circle
# u'\U0001f50b' = battery icon
filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'\u25a0'
# empty = (total_slots - len(filled)) * u'▹'
empty = (total_slots - len(filled)) * ' '

out = (filled + empty).encode('utf-8')
import sys

color_green = '%{$fg[green]%}'
color_yellow = '%{$fg[yellow]%}'
color_red = '%{$fg[red]%}'
color_reset = '%{$reset_color%}'
color_out = (
    color_green if len(filled) > 6
    else color_yellow if len(filled) > 4
    else color_red
)

out = ('[').encode('utf-8') + color_out + out + color_reset + (']').encode('utf-8')
sys.stdout.write(out)
