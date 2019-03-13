extends Area2D

#export(String, FILE, "*.tscn") var level_scene

#export (NodePath) onready var spawner = get_node(spawner) if spawner else null
#const spawner_variable = preload("res://Instances/PlayerSpawner.tscn")
#const player = preload("res://Instances/Characters/Player/Playeractual.tscn")

export (NodePath) onready var player = get_node(player) if player else null

#export (NodePath) onready var transition = get_node(transition) if transition else null

#Has the checkpoint already been triggered in that specific scene?
var alreadyUsed = false;

func _ready():
	pass

func _on_Checkpoint_body_entered(body):
	if body.name == "Player" && !alreadyUsed:
		print("This is Player.")
		#print(player.player_state)
		alreadyUsed = true;
		print("alreadyUsed has been set to True.")
		save.save_game()

func spawn():
	player.set_position(self.get_position())
	save.load_save()

func respawn():
	player.set_position(self.get_position())