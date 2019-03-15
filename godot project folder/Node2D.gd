extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var mainmenumusic = get_child().get_node("menumusic")
var hello = "hello"
func _ready():
	print(hello)
	mainmenumusic.play()
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
