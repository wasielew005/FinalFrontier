extends Node2D

var bullet = preload("bullet.tscn")

func fire(angle):
    var new_bullet = bullet.instance()
    new_bullet.angle = -angle
    new_bullet.position = get_parent().position
    get_parent().get_parent().add_child(new_bullet)
