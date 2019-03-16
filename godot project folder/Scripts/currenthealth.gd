extends Label

export (int) var healthLength = 1


func _ready():
	update()


func update():
	text = ("%0*d" % [healthLength, global.playerHealth]) + ("/") + ("%0*d" % [healthLength, global.maxHealth])

