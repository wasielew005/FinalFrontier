extends KinematicBody2D


var speed= 200
var motion = Vector2()

var path = []
var destination = Vector2()
export (int) var targethealth = 2
export (int) var points = 25000
var w_t=false
var init_path=false
var frame_count=0;







export var walk_slowdown = 0.5
export var nav_stop_threshold = 500
export (int) var destination_order= []
export var reverseOrder= true
export var fire_range = 300
export var projectile_speed = 10
export var fire_rate = 50




onready var navigation = get_parent().get_node("Navigation2D");
onready var player= get_parent().get_node("Player")




func _ready():

	set_process(true)

func enemy_hit():
	targethealth -= global.playergundmg
	print(targethealth)
	if targethealth <= 0:
		get_parent().get_node("Player/GUI/Score").adjust(points)
		queue_free()
		get_parent().get_node("Level Transition").set_position(Vector2(2058.620117,2453.052734))
		
		
				#get_tree().change_scene(level_scene)
		save.save_game()

func _process(delta):
	if !init_path:
		make_path()
		init_path=true
	navigate()




func navigate():
	var distance_to_destination = position.distance_to(player.global_position)
	destination = path[0]
	#print(distance_to_destination)
	if distance_to_destination > fire_range:
		move()
		if frame_count==fire_rate:
			$gun.fire(-rotation_degrees)
			frame_count=0;
		else:
			frame_count+=1
		update_path()
	else:
		look_at(player.global_position)
		if frame_count==fire_rate:
			$gun.fire(-rotation_degrees)
			frame_count=0;
		else:
			frame_count+=1




func move():
	motion = Vector2(speed, 0).rotated(rotation)
	#print(motion)
	if is_on_wall():
		make_path()
	move_and_slide(motion)


func make_path():
	var next_destination = player.global_position
	look_at(next_destination)
	path = navigation.get_simple_path(global_position, next_destination, true)

func update_path():
		if path.size() == 1:
			make_path()

		else:
			path.remove(0)