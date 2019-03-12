extends Area2D

#exports level_scene  so we can change it in the inspector.
#this allows us to instance the level changer many times and set the destination 
#without opening and changing the script each time
export(String, FILE, "*.tscn") var level_scene

#constantly checks if the player enters the collision area
#if they do, the scene is changed to the scene designated in level_scene
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
			if body.name == "Player":
				get_tree().change_scene(level_scene)