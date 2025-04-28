extends Node

var current_level = 1

var level_1 = [
	[5,5,5,5,5,5,5,5],
	[4,4,4,4,4,4,4,4],
	[3,3,3,3,3,3,3,3],
	[2,2,2,2,2,2,2,2],
	[1,1,1,1,1,1,1,1]
]

var level_2 = [
	[5,5,5,5,5,5,5,5],
	[4,4,4,4,4,4,4,4],
	[3,3,3,3,3,3,3,3],
	[2,2,2,2,2,2,2,2],
	[1,1,1,1,1,1,1,1]
]

var levels = [level_1, level_2]

func get_current_level():
	return levels[current_level - 1]
	
