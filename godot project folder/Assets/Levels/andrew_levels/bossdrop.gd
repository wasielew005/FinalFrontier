extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.visible = false
	pass

func _process(delta):
	self.position = get_parent().get_node("Player").global_position
	if self.visible == true:
		var t = Timer.new()
		t.set_wait_time(3)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		self.visible = false
	pass
