extends KinematicBody2D


var speed= 150
var motion = Vector2()
var possible_destinations = []
var path = []
var destination = Vector2()
export (int) var targethealth = 10
export (int) var points = 9000



export var walk_slowdown = 0.5
export var nav_stop_threshold = 5


onready var navigation = get_parent().get_node("Navigation2D");
onready var available_destinations = get_parent().get_node("Navigation2D/destinations");
onready var timer= get_node("Timer");

func _ready():
	set_process(true);
	possible_destinations = available_destinations.get_children()
	make_path()
	get_parent().get_node("Player").connect("hit", self, "targethit")

func targethit(decrease_health):
	targethealth -= global.playergundmg
	print(targethealth)
	if targethealth <= 0:
		get_parent().get_node("Player/GUI/Score").adjust(points)
		queue_free()

func _process(delta):
	navigate()


func navigate():
	var distance_to_destination = position.distance_to(path[0])
	destination = path[0]

	if distance_to_destination > nav_stop_threshold:
		move()
	else:
		update_path()


func move():
	look_at(destination)
	motion = (destination-position).normalized() * speed
	
	if is_on_wall():
		make_path()
	
	move_and_slide(motion)


func make_path():
	randomize()
	var next_destination = possible_destinations[randi() % possible_destinations.size()]
	
	path = navigation.get_simple_path(global_position, next_destination.global_position, false)


func update_path():
	if path.size() == 1:
		make_path()
	else:	
		path.remove(0)




	
