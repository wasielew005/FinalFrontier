extends Area2D

#exports level_scene  so we can change it in the inspector.
#this allows us to instance the level changer many times and set the destination 
#without opening and changing the script each time
export(String, FILE, "*.tscn") var level_scene

export (NodePath) onready var player = get_node(player) if player else null

#constantly checks if the player enters the collision area
#if they do, the scene is changed to the scene designated in level_scene
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
			if body.name == "Player":
				#saves player info before switching scenes
				save.save_game()
				get_tree().change_scene(level_scene)
				

#spawns player at the beginning of the level by reloading the scene
func spawn():
	#print(self.get_position())
	get_tree().reload_current_scene()
	save.load_save()

func respawn():
	player.set_position(self.get_position())

func save():
	var save_data = {
			"filename": get_filename(),
			"parent": get_parent(),
			"parentpath": get_parent().get_filename()
		}
	return save_data