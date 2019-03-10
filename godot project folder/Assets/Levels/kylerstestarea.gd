extends Node2D

var explosion = preload("res://Instances/Effects/Explosion.tscn")

onready var player = get_node("Player")

func _ready():
	player.connect("hit", self, "show_hit")
	
func show_hit(hit_location):
	var smoke = explosion.instance()
	add_child(smoke)
	smoke.set_position(hit_location)
	smoke.set_emitting(true)
	$GUI/Score.adjust(50)
