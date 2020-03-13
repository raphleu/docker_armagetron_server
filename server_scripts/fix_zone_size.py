#!/usr/bin/env python3

while True:
    line = input()
    # triggering off the NUM_HUMANS line which seems to be outputted at the start of every round. Unfortunately, this
    # might mean size adjustments are delayed by 1 round
    if line.startswith('NUM_HUMANS'):
        parsed_line = line.split()
        # make sure num_players has a second argument passed to it
        if (parsed_line[1]):
            num_players = parsed_line[1]
            if (num_players == '2'):
                print ('console_message Adjusting zone size for 2 players next round\n')
                print ('SIZE_FACTOR -1\n')
            elif (num_players == '3'):
                print ('console_message Adjusting zone size for 3 players next round\n')
                print ('SIZE_FACTOR 0\n')