extends Label


func _ready():
	update()

#shows "Reloading..." when the character reloads 
func update():
	if global.reloading == 1:
		visible=true
	if global.reloading == 0:
		visible=false