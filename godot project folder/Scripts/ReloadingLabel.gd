extends Label


func _ready():
	update()


func update():
	if global.reloading == 1:
		visible=true
	if global.reloading == 0:
		visible=false