extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	AudioServer.set_bus_volume_db(0, global.mastervolume)
	get_node("/root/menumusic").play()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
