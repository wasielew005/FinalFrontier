extends Node

#NOTE TO SELF: set this as an autoload

const SAVE_PATH = "user://SaveData.json"
var settings

func _ready():
	load_save()
	
func save_game():
	print("Called save_game() in save.gd")
	#data that needs to be saved:
		#what checkpoint node player just hit
			#how to pass in a node?; how is a node saved into JSON?
		#time, score, health, items, no. of bullets 
		#if(game_is_complete) save score into Scores.File
	pass

func load_save():
	print("Called load_save() in save.gd")
	#call nodeName.respawn() to re-place player without saving
	pass