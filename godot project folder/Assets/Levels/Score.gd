extends Label

export (int) var paddingLength = 6



func _ready():
	update()

func reset():
	global.value = 0
	update()

func adjust(adjustment):
	global.value += adjustment
	update()

func update():
	$Value.text = ("%0*d" % [paddingLength, global.value])

