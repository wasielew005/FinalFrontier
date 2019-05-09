extends Node

#global update

var highScore = 0 setget set_highScore
#var timeHighScore = 1 
const filepath = "user://highScores1.data"

func _ready():
	load_highScore()
	pass

func load_highScore():
	var file = File.new()
	if not file.file_exists(filepath): return
	file.open(filepath, File.READ)
	highScore = file.get_var()
	#timeHighScore = file.get_var()
	file.close()
	pass

func save_highScore():
	var file = File.new()
	file.open(filepath, file.WRITE)
	file.store_var(highScore)
	#file.store_var(timeHighScore)
	file.close()
	pass

func set_highScore():
	if global.value > highScore:
		highScore = global.value
		save_highScore()
	#if global.time_now > timeHighScore:
		#timeHighScore = global.time_now
		#save_highScore()
	pass

func _process(delta):
	set_highScore()