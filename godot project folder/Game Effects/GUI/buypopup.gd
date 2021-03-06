extends PopupMenu
func _ready():
	pass
	
func _on_close_pressed():
	$buypopup.hide()
	
func _bought_item():
	$boughtitempopup.show()
	var t = Timer.new()
	t.set_wait_time(2)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	$boughtitempopup.hide()

func _on_speedbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	#var pressed = true
	if global.value >= 1000:
		get_parent().get_parent().get_parent().get_node("GUI/Score").adjust(-1000)
		abilities.triple_speed()
		$speedbutton.disabled = true
		$boughtitempopup/popuptext.set_text("Bought Triple Speed!")
		_bought_item()
		var speedcd = Timer.new()
		speedcd.set_wait_time(10)
		speedcd.set_one_shot(true)
		self.add_child(speedcd)
		speedcd.start()
		yield(speedcd, "timeout")
		$speedbutton.disabled = false
	else:
		$boughtitempopup/popuptext.set_text("Not Enough Points!")
		_bought_item()

func _on_ddbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	if global.value >= 1500:
		get_parent().get_parent().get_parent().get_node("GUI/Score").adjust(-1500)
		abilities.double_damage()
		$ddbutton.disabled = true
		$boughtitempopup/popuptext.set_text("Bought Double Damage!")
		_bought_item()
		var ddcd = Timer.new()
		ddcd.set_wait_time(30)
		ddcd.set_one_shot(true)
		self.add_child(ddcd)
		ddcd.start()
		yield(ddcd, "timeout")
		$ddbutton.disabled = false
	else:
		$boughtitempopup/popuptext.set_text("Not Enough Points!")
		_bought_item()
		

func _on_medbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	if global.value >= 1000:
		get_parent().get_parent().get_parent().get_node("GUI/Score").adjust(-1000)
		abilities.medpack()
		$medbutton.disabled = true
		$boughtitempopup/popuptext.set_text("Bought Medpack!")
		_bought_item()
		var medcd = Timer.new()
		medcd.set_wait_time(30)
		medcd.set_one_shot(true)
		self.add_child(medcd)
		medcd.start()
		yield(medcd, "timeout")
		$medbutton.disabled = false
	else:
		$boughtitempopup/popuptext.set_text("Not Enough Points!")
		_bought_item()

func _on_unlimitedammonbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	if global.value >= 2500:
		get_parent().get_parent().get_parent().get_node("GUI/Score").adjust(-2500)
		abilities.unlimited_ammo()
		$unlimitedammonbutton.disabled = true
		$boughtitempopup/popuptext.set_text("Bought Unlimited Ammo!")
		_bought_item()
		var uacd = Timer.new()
		uacd.set_wait_time(30)
		uacd.set_one_shot(true)
		self.add_child(uacd)
		uacd.start()
		yield(uacd, "timeout")
		$unlimitedammonbutton.disabled = false
	else:
		$boughtitempopup/popuptext.set_text("Not Enough Points!")
		_bought_item()
		
func _on_invincbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	if global.value >= 2500:
		get_parent().get_parent().get_parent().get_node("GUI/Score").adjust(-2500)
		abilities.invincibility()
		$invincbutton.disabled = true
		$boughtitempopup/popuptext.set_text("Bought Invincibility!")
		_bought_item()
		var invcd = Timer.new()
		invcd.set_wait_time(30)
		invcd.set_one_shot(true)
		self.add_child(invcd)
		invcd.start()
		yield(invcd, "timeout")
		$invincbutton.disabled = false
	else:
		$boughtitempopup/popuptext.set_text("Not Enough Points!")
		_bought_item()
