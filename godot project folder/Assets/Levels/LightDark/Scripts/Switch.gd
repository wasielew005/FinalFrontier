extends Area2D

export (NodePath) onready var int_part = get_node(int_part)
export (NodePath) onready var popup = get_node(popup)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
	if event.is_action_pressed("ui_select"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name == "Player" && Input.is_action_pressed("ui_select"):
				print(body.name)
				if global.lights == true:
					global.lights = false
					
				elif global.lights == false:
					global.lights = true
				
				popup.show()
				int_part.hide()
				
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

func _process(delta):
	pass