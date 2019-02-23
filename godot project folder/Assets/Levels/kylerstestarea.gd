extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var player = get_node("Player")

func _ready():
	player.connect("hit", self, "show_hit")
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
