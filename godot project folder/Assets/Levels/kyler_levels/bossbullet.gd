extends KinematicBody2D

var motion = Vector2()

onready var player = get_parent().get_node("Player")
onready var projectile_speed = global.projectile_speed
var next_destination


func _ready():
	set_process(true)
	next_destination = player.global_position
	look_at(next_destination)
	motion = Vector2(projectile_speed, 0).rotated(rotation)




func _process(delta):
	var collision_info = move_and_collide(motion)
	if collision_info:
		if collision_info.collider == player:
			#print(global.playerHealth)
			global.playerHealth -= 1

		queue_free()




