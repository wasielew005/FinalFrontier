extends PopupMenu
func _ready():
	pass
	
func _on_close_pressed():
	$buypopup.hide()

func _on_speedbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	#var pressed = true
	if global.value > 1000:
		global.value -= 1000
		abilities.triple_speed()
		$speedbutton.disabled = true
		var speedcd = Timer.new()
		speedcd.set_wait_time(10)
		speedcd.set_one_shot(true)
		self.add_child(speedcd)
		speedcd.start()
		yield(speedcd, "timeout")
		$speedbutton.disabled = false

func _on_ddbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	if global.value > 1500:
		global.value -= 1500
		abilities.double_damage()
		$ddbutton.disabled = true
		var ddcd = Timer.new()
		ddcd.set_wait_time(30)
		ddcd.set_one_shot(true)
		self.add_child(ddcd)
		ddcd.start()
		yield(ddcd, "timeout")
		$ddbutton.disabled = false
		

func _on_medbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	abilities.medpack()

func _on_unlimitedammonbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	abilities.unlimited_ammo()

func _on_invincbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	abilities.invincibility()
	pass 
