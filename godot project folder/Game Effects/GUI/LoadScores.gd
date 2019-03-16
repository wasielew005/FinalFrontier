extends Button



func _ready():

	pass

func _on_Scores_pressed():
	get_tree().change_scene("res://Game Effects/GUI/highScores.tscn")