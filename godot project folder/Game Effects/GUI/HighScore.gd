extends Label

export (int) var paddingLength = 6
var score = 0 setget update

#this script is part of the HUD
#it checks for changes to the score and displays it on the HUD
#update() is called everytime there is a change to the score so that it can be visually changed

func _ready():
	update()


#below isn't currently used, but would set the players score to zero 
func reset():
	global.value = 0
	update()


func update():
	#sets the value in the HUD equal to the number assigned to "value" 
	$HighScoreVar.text = ("%0*d" % [paddingLength, HighScores.highScore])

