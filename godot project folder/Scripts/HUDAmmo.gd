extends Label

export (int) var ammoLength = 2


func _ready():
	update()


func update():
	text = ("%0*d" % [ammoLength, global.ammo_in_weapon]) + ("/") + ("%0*d" % [ammoLength, global.MAX_AMMO])

