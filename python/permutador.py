#!/usr/bin/env python

"""
Permutation Script by me lol
"""

from string import digits, ascii_uppercase, ascii_lowercase
from itertools import product
import base64

chars = ascii_uppercase

for n in range(3, 3 + 1):
    for comb in product(chars, repeat=n):
        permut = ''.join(comb)
        print permut
        params = 'name1=%s&name2=value2' % permut
        print params  
        print base64.b64encode(params)
