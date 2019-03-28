extends KinematicBody2D
var angle = 0.0
const speed = 50
var motion = Vector2()

onready var player= get_parent().get_node("Player")
var next_destination 
	

func _ready():
	set_process(true)
	next_destination = player.global_position
	look_at(next_destination)
	motion = Vector2(speed, 0).rotated(rotation)
	
	
    

func _process(delta):
    move_and_slide(motion)