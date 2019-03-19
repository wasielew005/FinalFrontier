extends Control



func _ready():
	$MarginContainer/CenterContainer/VBoxContainer/Resume.grab_focus()

func _physics_process(delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$MarginContainer/CenterContainer/VBoxContainer/Resume.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible
		$buypopup.hide()

func _on_Resume_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	
func _on_Buy_pressed():
	#get_node("/root/menumusic").play()
	$buypopup.show()

func _on_Quit_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	get_node("/root/menumusic").play()
	get_tree().change_scene("res://Game Effects/GUI/MainMenu.tscn")


func _on_close_pressed():
	$buypopup.hide()


func _on_MuteSound_pressed():
	if !AudioServer.is_bus_mute(0):
		$MarginContainer/CenterContainer/VBoxContainer/MuteSound/mute.set_text("Unmute")
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false)
		$MarginContainer/CenterContainer/VBoxContainer/MuteSound/mute.set_text("Mute")
