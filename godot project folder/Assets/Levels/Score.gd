extends Label

export (int) var paddingLength = 6

#this script is part of the HUD
#it checks for changes to the score and displays it on the HUD

func _ready():
	update()

func reset():
	global.value = 0
	update()

func adjust(adjustment):
	#adds new points to the running total of points and then runs update
	global.value += adjustment
	update()

func update():
	#sets the value in the HUD equal to the number assigned to "value" 
	$Value.text = ("%0*d" % [paddingLength, global.value])

