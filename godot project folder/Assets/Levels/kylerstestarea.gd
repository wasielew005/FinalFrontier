extends Node2D

#preloads the animation to be played when a gunshot collides 
#gets called in the show_hit function
var explosion = preload("res://Instances/Effects/Explosion.tscn")
#onready var spawner = preload("res://Instances/PlayerSpawner.tscn")

#calls the player node that gets used to connect the "hit" signal
onready var player = get_node("Player")

func _ready():
	#connects the signal hit from player. executes show_hit when the hit signal is recieved
	player.connect("hit", self, "show_hit")
	
#shows the bullet collision animation at collision point when a collision is detected
func show_hit(hit_location):
	var smoke = explosion.instance()
	add_child(smoke)
	smoke.set_position(hit_location)
	smoke.set_emitting(true)
