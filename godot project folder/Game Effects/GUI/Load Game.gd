extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Load_Game_pressed():
	get_tree().change_scene(save.load_save())
	#get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
	#global._get_time() must be called in any button that loads into the game
	#it will get the beginning time which is used in timekeeper.gd to calculate elapsed time
	global._get_time()
	
#func load_game():
	#how to access method in autoload?
