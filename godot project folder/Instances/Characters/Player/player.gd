extends KinematicBody2D

export (int) var speed = 200

var revolver_sound

var velocity = Vector2()

onready var basicshootcast = get_node("basicshootcast")

signal hit

func _ready():
	set_process_input(true)
	revolver_sound = get_node("revolvershot")
	
	

func _input(event):
	if event.is_action_pressed("left_click"):
		shoot()
		revolver_sound.play()

#		var sfxPlayer = AudioStreamPlayer.new()
#		self.add_child(sfxPlayer)
#		sfxPlayer.stream = load("res://Assets/SFX/Gun+Shot2.wav")
#		sfxPlayer.play()

func shoot():
	if basicshootcast.is_colliding():
		emit_signal("hit", basicshootcast.get_collision_point())

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