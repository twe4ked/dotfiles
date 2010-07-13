#!/usr/bin/env python
# coding=UTF-8

# Via Steve Losh
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

# Had to run:
# chmod +x .dotfiles/lib/battery.py
# to get this file to run correctly

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

filled_count = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'▸'

filled = int(math.ceil(charge_threshold * (total_slots / 100.0))) * u'⚡'
empty = (total_slots - 10) * u'▹'

out = (filled + empty).encode('utf-8')
import sys

color_green = '%{[32m%}'
color_yellow = '%{[1;33m%}'
color_red = '%{[31m%}'
color_reset = '%{[00m%}'
color_out = (
    color_green if len(filled_count) > 6
    else color_yellow if len(filled_count) > 4
    else color_red
)

out = color_out + out + color_reset
sys.stdout.write(out)