#!/usr/bin/python3
print("WAIT_FOR_EXTERNAL_SCRIPT 1\nWAIT_FOR_EXTERNAL_SCRIPT_TIMEOUT 1");

num_players = -1;
while True:
	line = input()
	if line.startswith("TEAM_PLAYER_ADDED"):
		num_players += 1;
	elif line.startswith("TEAM_PLAYER_REMOVED"):
		num_players -= 1;
	elif line.startswith('NUM_HUMANS'):
		parsed_line = line.split()
		if num_players == -1:
			line = "ROUND_COMMENCING";
		# make sure num_players has a second argument passed to it
		if len(parsed_line) >= 1:
			num_players = int(parsed_line[1]);
	if line.startswith("ROUND_COMMENCING"):
		if num_players != -1:
			if num_players > 10:
				num_players = 10;
			elif num_players < 2:
				num_players = 2;
			print("CONSOLE_MESSAGE Zone size adjusted for "+str(num_players)+" players.");
			print("MAP_FILE Titanoboa/sumobar/dynamic-0."+str(num_players)+".aamap.xml");
			print("SIZE_FACTOR 1");
