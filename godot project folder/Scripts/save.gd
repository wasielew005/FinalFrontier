extends Node

#"user://" stores in ~/.local/share/godot/app_userdata/Name on macOS and Linux, and %APPDATA%/Name on Windows
#const SAVE_PATH = "user://SaveData.json"

#because i, for the life of me, can't find %APP_DATA%, i'm using this until i'm able to make sure it works
const SAVE_PATH = "C://Users/AJ/Desktop/SaveData.json"

#File is godot's read/write system
var file = File.new()

func _ready():
	#if SaveData.json doesn't exist, then create it. else, do nothing
	if not file.file_exists(SAVE_PATH):
		create_save()
	#load_save()

#creates SaveData.json file in specified path
func create_save():
	file.open(SAVE_PATH, File.WRITE)
	file.close()

func save_game():
	print("Called save_game() in save.gd")
	
	file.open(SAVE_PATH, File.WRITE)
	
	var save_nodes = get_tree().get_nodes_in_group("persist")
	
	for x in save_nodes:
		var node_data = x.call("save")
		file.store_line(to_json(node_data))
	
	file.close()


func load_save():
	print("Called load_save() in save.gd")
	
	file.open(SAVE_PATH, File.READ)
	
	var loaded_data = {}
	loaded_data = parse_json(file.get_as_text())

	#global.ammo_in_weapon = loaded_data['ammo']
	#global.value = loaded_data['score']
	
	
	
	#call nodeName.respawn() to re-place player without saving
	return loaded_data['level_scene']