extends CanvasLayer

func _on_Easy_pressed():
	global.difficulty = "easy"
	get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
	global.current_level = 0
	global.level_order = [1, 2, 3, 4, 5, 6]
	save.save_game()
	global._get_time()
	pass


func _on_Normal_pressed():
	global.difficulty = "normal"
	get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
	global.current_level = 0
	global.level_order = [1, 2, 3, 4, 5, 6]
	global._get_time()
	pass


func _on_Hard_pressed():
	global.difficulty = "hard"
	get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
	global.current_level = 0
	global.level_order = [1, 2, 3, 4, 5, 6]
	global._get_time()
	pass

func save():
	print("Called Level Selection save.")
	var save_data = {
			"level_order": [1, 2, 3, 4, 5, 6],
			"current_level": 0,
			"filepath": "LevelOrder.save"
		}
	return save_data