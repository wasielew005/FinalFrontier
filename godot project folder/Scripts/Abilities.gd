extends Node

func _ready():
	pass

#in PauseScreen, use this to test
#var player = get_parent().get_parent()
#player.speed = abilities.double_speed(player.speed)
func double_speed(var speed):
	speed = speed * 3
	print("Triple speed!")
	return speed