extends Sprite

var open = false

func _ready():
	self.visible = false
	pass

func _process(delta):
	self.position = get_parent().get_node("Player").global_position
	pass

func _input(event):
	
	if event.is_action_pressed("ui_select") and !open:
		self.visible = true
		print("open")
		open = true
	elif event.is_action_pressed("ui_select"):
		self.visible = false
		open = false
	else:
		pass
		
		