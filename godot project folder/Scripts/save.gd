extends Node

#"user://" stores in ~/.local/share/godot/app_userdata/Name on macOS and Linux, and %APPDATA%/Name on Windows
const TRANSITION_PATH = "user://LevelTransition.save"
const PLAYER_PATH = "user://Player.save"
const LEVELORDER_PATH = "user://LevelOrder.save"

#because i, for the life of me, can't find %APP_DATA%, i'm using this until i'm able to make sure it works
#const TRANSITION_PATH = "C://Users/AJ/Desktop/LevelTransition.save"
#const PLAYER_PATH = "C://Users/AJ/Desktop/Player.save"

#File is godot's read/write system
var file = File.new()

func _ready():
	#if SaveData.json doesn't exist, then create it. else, do nothing
	if not file.file_exists(TRANSITION_PATH):
		create_save()
	if not file.file_exists(PLAYER_PATH):
		create_save()
	if not file.file_exists(LEVELORDER_PATH):
		create_save()
	#load_save()

#creates SaveData.json file in specified path
func create_save():
	file.open(TRANSITION_PATH, File.WRITE)
	file.close()
	file.open(PLAYER_PATH, File.WRITE)
	file.close()
	file.open(LEVELORDER_PATH, File.WRITE)
	file.close()

func save_game():
	print("Called save_game() in save.gd")
	
	var save_nodes = get_tree().get_nodes_in_group("persist")
	
	for x in save_nodes:
		var node_data = x.call("save")
		var name = node_data['filepath']
		var save_path = "user://" + name
		file.open(save_path, File.WRITE)
		
		file.store_line(to_json(node_data))
		file.close()
	
	

func load_save():
	print("Called load_save() in save.gd")
	
	#level transition data
	file.open(TRANSITION_PATH, File.READ)
	
	var transition_data = {}
	transition_data = parse_json(file.get_as_text())
	
	file.close()
	
	#player data
	file.open(PLAYER_PATH, File.READ)
	
	var player_data = {}
	player_data = parse_json(file.get_as_text())
	
	global.saved_elapsed = player_data['saved_elapsed']
	global.saved_millisec = player_data['saved_millisec']
	global.value = player_data['score']
	global.playerHealth = player_data['health']
	global.isGameComplete = player_data['gameComplete']
	global.player_state = player_data['player_state']
	
	file.close()
	
	#level order data
	file.open(LEVELORDER_PATH, File.READ)
	
	var order_data = {}
	order_data = parse_json(file.get_as_text())
	global.level_order = order_data['level_order']

	file.close()
	
	
	#call nodeName.respawn() to re-place player without saving
	#this loads
	return transition_data['level_scene']






