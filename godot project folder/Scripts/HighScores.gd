extends Node

#global update

var highScore = 0 setget set_highScore
const filepath = "user://highScores1.data"

func _ready():
	load_highScore()
	pass

func load_highScore():
	var file = File.new()
	if not file.file_exists(filepath): return
	file.open(filepath, File.READ)
	highScore = file.get_var()
	file.close()
	pass

func save_highScore():
	var file = File.new()
	file.open(filepath, file.WRITE)
	file.store_var(highScore)
	file.close()
	pass

func set_highScore():
	if global.value > highScore:
		highScore = global.value
		save_highScore()
	pass

func _process(delta):
	set_highScore()
	print(highScore)