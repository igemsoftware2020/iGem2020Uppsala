#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jul  2 09:41:48 2020

@author: user
"""

f = open('/home/user/Documents/iGem/dock/7_4dock_BF10_HSP.pdb','r')
o = open('/home/user/Documents/iGem/dock/7_4dock_BF10_HSP_fixed.pdb', 'w+')

contents = f.readlines()
newcontents = []

for i in contents:
    if len(i) >= 21 and i[21] == 'A':
        a = i[:21]+'B'+i[22:72]+'B'+i[73:]
    elif  len(i) >= 20 and i[21] == 'B':
        a = i[:21]+'A'+i[22:72]+'A'+i[73:]
    elif len(i) <= 20:
        a=i
    o.writelines(a)
    newcontents.append(a)


b = contents[5][72]
