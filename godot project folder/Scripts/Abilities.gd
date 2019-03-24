extends Node

func _ready():
	pass

#in PauseScreen, use this to test
#var player = get_parent().get_parent()
var double_damage = false
onready var player = get_node("Player")
var triple_speed = false

#player.speed = abilities.double_speed(player.speed)

#var t = Timer.new()
#t.set_wait_time(1)
#t.set_one_shot(true)
#self.add_child(t)
#t.start()
#yield(t, "timeout")

func triple_speed():
		
	if Input.is_key_pressed("ui_3"):
		player.speed = player.speed * 3
		print("Triple speed!")
		var t = Timer.new()
		t.set_wait_time(5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		player.speed = player.speed / 3
		printf("Normal speed")
	
func medpack():
	if Input.is_key_pressed("ui_4"):
		if(global.playerHealth < global.maxHealth):
			global.playerHealth = global.maxHealth
			print("Health restored!")
		else:
			print("Health is already full!")
	
func double_damage():
	if Input.is_key_pressed("ui_5"):
		double_damage = true
		printf("Double damage!")
		var t = Timer.new()
		t.set_wait_time(5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		double_damage = false
		printf("Normal damage")
	
func invisibility():
	
	pass
	
func invincibility():
	
	pass
	
func unlimited_ammo():
	pass