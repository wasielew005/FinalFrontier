extends PopupMenu
func _ready():
	pass
	
func _on_close_pressed():
	$buypopup.hide()

func _on_speedbutton_pressed():
	print("Speed ability purchased")
	var player = get_parent().get_parent().get_parent()
	#var pressed = true
	abilities.triple_speed()

func _on_medpack_pressed():
	var player = get_parent().get_parent().get_parent()
	abilities.medpack()
	pass

func _on_doubledamage_pressed():
	var player = get_parent().get_parent().get_parent()
	abilities.double_damage()
	pass
