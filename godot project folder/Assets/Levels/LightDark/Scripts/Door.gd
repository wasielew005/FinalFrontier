extends Node2D

export (NodePath) onready var popupFailure = get_node(popupFailure)
export (NodePath) onready var popupSuccess = get_node(popupSuccess)
export (NodePath) onready var door = get_node(door)

func _ready():
	pass

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" && Input.is_action_pressed("ui_select") && global.has_code == false:
			global.has_code = false
			popupFailure.show()
			
			var t = Timer.new()
			t.set_wait_time(10)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
			
			popupFailure.hide()
			
		if body.name == "Player" && Input.is_action_pressed("ui_select") && global.has_code == true:
			global.has_code = false
			popupSuccess.show()
			door.hide()
			
			var t = Timer.new()
			t.set_wait_time(10)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
			
			popupSuccess.hide()

		else:
			pass

