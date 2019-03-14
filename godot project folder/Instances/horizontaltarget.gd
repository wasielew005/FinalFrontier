extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var targethealth = 4


func _ready():
	get_parent().get_node("Player").connect("damage", self, "targethit")

func targethit(decrease_health):
	targethealth -= global.playergundmg
	print(targethealth)
	if targethealth <= 0:
			queue_free()

	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
