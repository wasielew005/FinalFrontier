extends AudioStreamPlayer2D


# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var playerFS = AudioStreamPlayer.new()
	self.add_child(playerFS)
	playerFS.stream = load("res://Assets/SFX/Footstep.wav")

func get_input():
	if Input.is_action_pressed('right'):
        $AudioStreamPlayer2D.play()
	if Input.is_action_pressed('left'):
        $AudioStreamPlayer2D.play()
	if Input.is_action_pressed('down'):
        $AudioStreamPlayer2D.play()
	if Input.is_action_pressed('up'):
        $AudioStreamPlayer2D.play()
