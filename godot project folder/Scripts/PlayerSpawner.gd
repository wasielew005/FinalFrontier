extends Node2D

export (Vector2) var spawn_position

const player_variable = preload("res://Instances/Characters/Player/Playeractual.tscn")

var previous_position
var player

#Note that your level shouldn't have an instance of "Player" in it. PlayerSpawner adds "Player" for you.

func _ready():
	if get_node("SpawnPoint").has_node("Player"):
		print("Player already exists")
	else:
		spawn()
	pass

func spawn():
	#Where you place the Spawner node is where the Player will start, given that the variable "spawn_position" is set to (0,0)
	if get_node("SpawnPoint").has_node("Player") && player.state == "Dead": 
		print("Player is dead")
		player.state = "alive"
		respawn()
		#print("Made it to this spawn call")
		pass
	else:
		player = player_variable.instance()
		get_node("SpawnPoint").set_position(spawn_position)
		get_node("SpawnPoint").add_child(player)
		#Sets this spawn position as the last position/checkpoint the player's located at
		previous_position = spawn_position
	pass

func respawn():
	player.set_position(spawn_position)
	print("Respawning node")
	pass
