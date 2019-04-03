extends Button

export (NodePath) var button_path
onready var button = get_node(button_path)
var file = File.new()

func _ready():
	#checks to see if Player.save is an empty file. if it is, disable the load button
	file.open("user://Player.save", File.READ)
	var data = {}
	data = parse_json(file.get_as_text())
	
	if not data:
		button.set_disabled(true)
	pass


func _on_Load_Game_pressed():
	#leave commented out unless you change where your save file is	
	get_tree().change_scene(save.load_save())
	#get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
	#global._get_time() must be called in any button that loads into the game
	#it will get the beginning time which is used in timekeeper.gd to calculate elapsed time
	global._get_time()
