extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var triggercount = 0

func _ready():
	pass

func doortrigger():
	trigercount += 1
	if triggercount == 1:
		get_node("doorone").visible=true
		get_node("doorzero").visible=false