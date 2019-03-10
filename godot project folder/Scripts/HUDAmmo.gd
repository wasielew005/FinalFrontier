extends Label

export (int) var ammoLength = 1


func _ready():
	update()


func update():
	text = ("%0*d" % [ammoLength, global.ammo_in_weapon])

