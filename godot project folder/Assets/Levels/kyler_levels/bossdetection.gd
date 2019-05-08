extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var enteredcount = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if enteredcount == 0:
			enteredcount +=1
			get_parent().get_node("door").visible = true
			get_parent().get_node("door/CollisionShape2D").disabled = false
			get_parent().player.detected=true
			get_node("bossdetectioncollision").disabled = true
			
			
