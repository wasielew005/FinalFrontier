extends KinematicBody2D

export (int) var speed = 200

var revolver_sound
#var ammo_in_weapon = 6 now in global.gd in the scripts folder
var spare_ammo = 20
const AMMO_IN_MAG = 6

var velocity = Vector2()



onready var basicshootcast = get_node("basicshootcast")

signal hit








func _ready():
	set_process_input(true)
	revolver_sound = get_node("revolvershot")

#Shooting
func _input(event):
	if event.is_action_pressed("left_click"):
		if global.ammo_in_weapon > 0:
			shoot()
			global.ammo_in_weapon -= 1
			revolver_sound.play()
	if event.is_action_pressed("reload"):
		global.ammo_in_weapon = 6

func shoot():
	if basicshootcast.is_colliding():
		var collider = basicshootcast.get_collider()
		emit_signal("hit", basicshootcast.get_collision_point())
		if collider.is_in_group("targets"):
			$GUI/Score.adjust(100)
		if collider.is_in_group("htargets"):
			$GUI/Score.adjust(50)

func get_input():
    look_at(get_global_mouse_position())
    velocity = Vector2()
    if Input.is_action_pressed('right'):
        velocity.x += 1
    if Input.is_action_pressed('left'):
        velocity.x -= 1
    if Input.is_action_pressed('down'):
        velocity.y += 1
    if Input.is_action_pressed('up'):
        velocity.y -= 1
    velocity = velocity.normalized() * speed

func _physics_process(delta):
    get_input()
    move_and_slide(velocity)