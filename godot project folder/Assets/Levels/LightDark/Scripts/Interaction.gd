extends Area2D

export (NodePath) onready var int_part = get_node(int_part)
export (NodePath) onready var popup = get_node(popup)

func _ready():
	pass

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" && Input.is_action_pressed("ui_select") && self.name == "Lighter":
			global.has_lighter = true
			int_part.hide()
			popup.show()
			
			var t = Timer.new()
			t.set_wait_time(10)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
			
			popup.hide()
			
		elif body.name == "Player" && Input.is_action_pressed("ui_select") && self.name == "Code":
			global.has_code = true
			int_part.hide()
			popup.show()
			
			var t = Timer.new()
			t.set_wait_time(10)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
			
			popup.hide()

		else:
			pass

