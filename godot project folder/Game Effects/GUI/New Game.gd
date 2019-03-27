extends Button

func _ready():
	pass

func _on_New_Game_pressed():
	save.load_save();
	get_tree().change_scene("res://Game Effects/GUI/NewGame.tscn")
