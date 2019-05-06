extends Area2D

#exports level_scene  so we can change it in the inspector.
#this allows us to instance the level changer many times and set the destination 
#without opening and changing the script each time
export(String, FILE, "*.tscn") var level_scene
export(bool) var final_floor

export (String, FILE, "*.tscn") var light
export (String, FILE, "*.tscn") var dark

export (NodePath) onready var player = get_node(player) if player else null

#constantly checks if the player enters the collision area
#if they do, the scene is changed to the scene designated in level_scene
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
			if body.name == "Player":
				#if final_floor:
					#changes to next world in specified order
					#global.current_level += 1
					#get_tree().change_scene(global.level_order[global.current_level])
					#save.save_game()
			#else
				#saves player info and switches scenes
				
				if global.lights == true && light != null:
					get_tree().change_scene(light)
				elif global.lights == false && dark != null:
					get_tree().change_scene(dark)
				else:
					get_tree().change_scene(level_scene)
				save.save_game()
				

# after boss level is complete, in script for boss level:
# global.current_level += 1
# get_tree().change_scene(global.level_order[global.current_level])
# save.save_game()
# 


#spawns player at the beginning of the level by reloading the scene
func spawn():
	#print(self.get_position())
	get_tree().reload_current_scene()
	#save.load_save()

func respawn():
	#player.set_position(self.get_position())
	pass

func save():
	#var file_name = "LevelTransitionData.save"
	#call to set highscore
	var save_data = {
			"filename": get_filename(),
			"parent": get_filename(),
			"parentpath": get_parent().get_filename(),
			"level_scene": self.level_scene,
			"filepath": "LevelTransition.save"
		}
	return save_data