#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jul  2 09:41:48 2020

@author: tjmcawesome
"""
#this script will take a pdb file with chains A and B and reverse them
# chain A becomes chain B, and vice versa

#specify your pdb file that you wish to alter
f = open('/home/user/Documents/iGem/dock/7_4dock_BF10_HSP.pdb','r')
#specify the file you wish to write to
o = open('/home/user/Documents/iGem/dock/7_4dock_BF10_HSP_fixed.pdb', 'w+')

#holds the lines while we work
contents = f.readlines()
#holds our new data so we can see that our modifications are working
newcontents = []
f.close()

#loops over the file and replaces A with B and vice versa, this assumes your
#pdb files is formatted with chain name in position 21 and 72
for i in contents:
    if len(i) >= 21 and i[21] == 'A':
        a = i[:21]+'B'+i[22:72]+'B'+i[73:]
    elif  len(i) >= 20 and i[21] == 'B':
        a = i[:21]+'A'+i[22:72]+'A'+i[73:]
    elif len(i) <= 20:
        a=i
    o.writelines(a)
    newcontents.append(a)

o.close()
