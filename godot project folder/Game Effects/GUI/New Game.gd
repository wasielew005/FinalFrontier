extends Button

export (NodePath) var button_path
onready var button = get_node(button_path)
var file = File.new()

func _ready():
	pass

func _on_New_Game_pressed():
	#checks to see if Player.save is an empty file. if it is not, load save file to get gameComplete
	file.open("user://Player.save", File.READ)
	var data = {}
	data = parse_json(file.get_as_text())
	
	if data:
		save.load_save();
		global.difficulty = ""
	
	get_tree().change_scene("res://Game Effects/GUI/NewGame.tscn")
