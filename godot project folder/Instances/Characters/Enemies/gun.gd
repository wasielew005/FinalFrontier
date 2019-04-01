extends Node2D

var bullet = preload("bullet.tscn")
onready var spawn = get_parent().get_node("spawn")

func fire(angle):
	var new_bullet = bullet.instance()
	new_bullet.position = spawn.global_position
	get_parent().get_parent().add_child(new_bullet)
