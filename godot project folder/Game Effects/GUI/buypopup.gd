extends PopupMenu
func _ready():
	pass
	
func _on_close_pressed():
	$buypopup.hide()

func _on_speedbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	#var pressed = true
	abilities.triple_speed()

func _on_ddbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	abilities.double_damage()

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
