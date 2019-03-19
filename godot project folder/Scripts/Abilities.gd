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
	
func medpack(var playerHealth):
	if(playerHealth < maxHealth):
		playerHealth = maxHealth
		print("Health restored!")
	return playerHealth
	
func double_damage():
	pass
	
func invisibility():
	pass
	
func invincibility():
	pass