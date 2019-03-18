extends KinematicBody2D


export (int) var targethealth = 4
export (int) var points = 50

func _ready():
	get_parent().get_node("Player").connect("hit_htarget", self, "targethit")
	

func targethit(decrease_health):
	targethealth -= global.playergundmg
	print(targethealth)
	if targethealth <= 0:
		get_parent().get_node("Player/GUI/Score").adjust(points)
		queue_free()

