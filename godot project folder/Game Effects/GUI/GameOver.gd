extends Control


func _ready():
	$MarginContainer/TextureRect/HBoxContainer/restart.grab_focus()

#on player health @ zero: emit_signal("game_over") to call this scene
#drop this into scene, then connect game_over to player node

func _physics_process(delta):
	if $MarginContainer/TextureRect/HBoxContainer/restart.is_hovered() == true:
		$MarginContainer/TextureRect/HBoxContainer/restart.grab_focus()
	
	if $MarginContainer/TextureRect/HBoxContainer/quit.is_hovered() == true:
		$MarginContainer/TextureRect/HBoxContainer/quit.grab_focus()

func _on_restart_pressed():
	#load last save (Level Transition/Checkpoint)
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().change_scene("res://Game Effects/GUI/MainMenu.tscn")
