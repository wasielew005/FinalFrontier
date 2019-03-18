extends CanvasLayer

func _ready():
	pass
	#if game = complete, then show select levels
	#if not isGameComplete:
		#$LevelSelector.hide()

func _on_Easy_pressed():
	global.difficulty = "easy"
	get_tree().change_scene("res://Assets/Levels/kylerstestarea.tscn")
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
