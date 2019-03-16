extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_musicdown_pressed():
	if global.music_volume >= -25:
		global.music_volume -= 2
		AudioServer.set_bus_volume_db(2, global.music_volume)
