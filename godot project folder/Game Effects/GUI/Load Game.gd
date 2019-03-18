extends Button

func _ready():
	pass


func _on_Load_Game_pressed():
	#leave commented out unless you change where your save file is
	get_tree().change_scene(save.load_save())
	#get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
	#global._get_time() must be called in any button that loads into the game
	#it will get the beginning time which is used in timekeeper.gd to calculate elapsed time
	global._get_time()
	
#func load_game():
	#how to access method in autoload?
