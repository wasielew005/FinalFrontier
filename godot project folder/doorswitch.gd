extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var switchon = false

func _ready():
	pass
	
func enemy_hit():
	if switchon == false:
		get_node("switchon").visible=true
		get_node("switchoff").visible=false
		switchon = true
		get_parent().get_node("activateddoor").doortrigger()
		
