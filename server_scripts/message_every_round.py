#!/usr/bin/env python3

while True:
    line = input()
    # triggering off the ROUND_COMMENCING line which seems to be outputted at the start of every round.
    if line.startswith('ROUND_COMMENCING'):
        print ('console_message You got it working! Nice job!\n')