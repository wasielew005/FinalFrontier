extends Button

func _ready():
	pass

func _on_Back_pressed():
	get_node("/root/menumusic").play()
	get_tree().change_scene("res://Game Effects/GUI/MainMenu.tscn")
