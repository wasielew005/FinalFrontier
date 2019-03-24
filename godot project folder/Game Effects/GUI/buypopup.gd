extends PopupMenu
func _ready():
	pass
	
func _on_close_pressed():
	$buypopup.hide()

func _on_speedbutton_pressed():
	var player = get_parent().get_parent().get_parent()
	abilities.double_speed()
	pass # replace with function body
