extends AudioStreamPlayer2D



func _ready():
  	var player = AudioStreamPlayer.new()
  	self.add_child(player)
  	player.stream = load("res://Assets/SFX/Gun+Shot2.wav")
  	player.play()

