extends Button

func _ready():
	pass

func _on_New_Game_pressed():
	get_tree().change_scene("res://Game Effects/GUI/NewGame.tscn")
