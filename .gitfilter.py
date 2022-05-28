#!/usr/bin/env python3

import sys
import os

bad=(
  'chat_id',
  'bot_token',
  'dataplicity',
  )

if len(sys.argv) != 2:
  exit

with open(sys.argv[1], 'r') as f:
  for l in f.readlines():
    if not any([a for a in bad if a in l]):
      print(l.rstrip())