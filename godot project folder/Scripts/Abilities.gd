
extends Node

func _ready():
	pass

#in PauseScreen, use this to test
#var player = get_parent().get_parent()
var double_damage = false
var triple_speed = false

#var t = Timer.new()
#t.set_wait_time(1)
#t.set_one_shot(true)
#self.add_child(t)
#t.start()
#yield(t, "timeout")

func triple_speed():
		global.speed = global.speed * 3
		print("Triple speed!")
		var t = Timer.new()
		t.set_wait_time(5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		global.speed = global.speed / 3
		print("Normal speed")
	
func medpack():
	if(global.playerHealth < global.maxHealth):
		global.playerHealth = global.maxHealth
		print("Health restored!")
	else:
		print("Health is already full!")
	
func double_damage():
	
		double_damage = true
		print("Double damage!")
		var t = Timer.new()
		t.set_wait_time(5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		double_damage = false
		print("Normal damage")
	
func invincibility():
	global.playerHealth = global.maxHealth
	print("Invincibility!")
	var t = Timer.new()
	t.set_wait_time(5)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	global.playerHealth = global.playerHealth
	print("Back to normal...")
	pass
	
func unlimited_ammo():
    global.maxammo = 1
    print("Max Ammo!")
    var ammoTimer = Timer.new()
    ammoTimer.set_wait_time(5)
    ammoTimer.set_one_shot(true)
    self.add_child(ammoTimer)
    ammoTimer.start()
    yield(ammoTimer, "timeout")
    global.maxammo = 0
    print("Back to normal...")
    #pass
