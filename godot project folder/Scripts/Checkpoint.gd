extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(String, FILE, "*.tscn") var level_scene

export (NodePath) onready var spawner = get_node(spawner) if spawner else null
#const spawner_variable = preload("res://Instances/PlayerSpawner.tscn")

var previous_position

#Has the checkpoint already been triggered in that specific scene?
var alreadyUsed = false;

func _ready():
	pass

func _on_Checkpoint_body_entered(body):
	if body.name == "Player" && !alreadyUsed:
		print("This is Player.")
		alreadyUsed = true;
		print("alreadyUsed has been set to True.")
		
		spawner.spawn()
		#spawner already exists. how do i call it from here? what's a packedscene?
		
		
		#get_tree().change_scene(level_scene)

