extends CanvasLayer

func _on_Easy_pressed():
	global.difficulty = "easy"
	pass


func _on_Normal_pressed():
	global.difficulty = "normal"
	pass


func _on_Hard_pressed():
	global.difficulty = "hard"
	pass

func _on_StartGameButton_pressed():
	if global.isGameComplete:
		global.level_order = get_node("MarginContainer/HBoxContainer/Level Selection").selectedList
	else:
		global.level_order = [1, 2, 3, 4, 5, 6]
	
	global.current_level = 0
	
	#get_tree().change_scene(global.level_order[global.current_level])
	get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
	
	save.save_game()
	global.saved_elapsed = 0
	global._get_time()
	pass


func _on_BackButton_pressed():
	get_tree().change_scene("res://Game Effects/GUI/MainMenu.tscn")

func save():
	#change level_order to default level_order
	var save_data = {
			"level_order": [1, 2, 3, 4, 5, 6],
			"current_level": 0,
			"difficulty": global.difficulty,
			"filepath": "LevelOrder.save"
		}
	return save_data

