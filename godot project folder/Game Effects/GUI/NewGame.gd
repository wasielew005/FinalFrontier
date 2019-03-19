extends CanvasLayer

func _on_Easy_pressed():
	global.difficulty = "easy"
	get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
	#global.level_order
	#global.current_level = 0
	global._get_time()
	pass


func _on_Normal_pressed():
	global.difficulty = "normal"
	get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
	global._get_time()
	pass


func _on_Hard_pressed():
	global.difficulty = "hard"
	get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
	global._get_time()
	pass
