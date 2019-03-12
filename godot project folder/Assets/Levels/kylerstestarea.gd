extends Node2D

var explosion = preload("res://Instances/Effects/Explosion.tscn")
onready var spawner = preload("res://Instances/PlayerSpawner.tscn")

#onready var player = get_node("Player")

func _ready():
	#spawner.spawn()
	#player.connect("hit", self, "show_hit")
	pass
	
func show_hit(hit_location):
	var smoke = explosion.instance()
	add_child(smoke)
	smoke.set_position(hit_location)
	smoke.set_emitting(true)
