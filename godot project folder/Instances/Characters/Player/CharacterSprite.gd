
#I believe this is left over from when the character was animated
#this script is not currently used anywhere


extends Sprite

var timer

func _ready():
	timer = Timer.new()
	timer.connect("timeout", self, "tick")
	add_child(timer)
	timer.wait_time = 0.2
	timer.start()

func tick():
	if self.frame < 3:
		self.frame += 1
	else:
		self.frame = 0