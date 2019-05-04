extends Light2D

export (NodePath) onready var lighter = get_node(lighter)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	if(global.has_lighter):
		lighter.show()
	else:
		lighter.hide()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
