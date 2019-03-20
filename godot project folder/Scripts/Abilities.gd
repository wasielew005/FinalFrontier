extends Node

func _ready():
	pass

#in PauseScreen, use this to test
#var player = get_parent().get_parent()
#player.speed = abilities.double_speed(player.speed)

#var t = Timer.new()
#t.set_wait_time(1)
#t.set_one_shot(true)
#self.add_child(t)
#t.start()
#yield(t, "timeout")

func double_speed(var speed):
	if Input.is_key_pressed("ui_3"):
		
		speed = speed * 3
		print("Triple speed!")
	return speed
	
func medpack(var playerHealth):
	if Input.is_key_pressed("ui_4"):
		if(playerHealth < maxHealth):
			playerHealth = maxHealth
			print("Health restored!")
		else:
			print("Health is already full")
	return playerHealth
	
func double_damage(var playerDamage):
	if Input.is_key_pressed("ui_5"):
		playerDamage = playerDamage * 2
	return playerDamage
	
func invisibility():
	
	pass
	
func invincibility():
	
	pass
	
func silencer():
	pass