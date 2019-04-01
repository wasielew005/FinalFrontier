extends KinematicBody2D


var speed= 150
var motion = Vector2()
var possible_destinations = []
var path = []
var destination = Vector2()
export (int) var targethealth = 10
export (int) var points = 9000
var i=1
var test_dest= [0,1,2]
var w_t=false
var target
var cone_exception=false
var collision_info



export var walk_slowdown = 0.5
export var nav_stop_threshold = 50
export (int) var destination_order= []
export var reverseOrder= true




onready var navigation = get_parent().get_node("Navigation2D");
onready var available_destinations = get_parent().get_node("Navigation2D/destinations");
onready var timer= get_node("Timer");
onready var player= get_parent().get_node("Player")
onready var detection_area= $Visibility



func _ready():
	
	set_process(true)
	possible_destinations = available_destinations.get_children()
	make_path()
	#get_parent().get_node("Player").connect("hit", self, "targethit")
	$Visibility/flashlight.modulate=Color(1,1,1,.5)
	detection_area.connect("body_entered",self,"_on_Visibility_body_entered")
	detection_area.connect("body_exited",self,"_on_Visibility_body_exited")
	
	
	

	

func enemy_hit():
	targethealth -= global.playergundmg
	print(targethealth)
	if targethealth <= 0:
		get_parent().get_node("Player/GUI/Score").adjust(points)
		queue_free()

func _process(delta):
	
	navigate(delta)
	if cone_exception==false:
		player.basicshootcast.add_exception(detection_area)
		cone_exception==true
	
	
func _on_Visibility_body_entered(body):	
		if target!=null:
			return
		elif body == player:
			target=body
			print("Target acquired")
			$Visibility/flashlight.modulate= Color(1,1,1,.01)
			player.detected=true;
func _on_Visibility_body_exited(body):
		if body==target:
			target=null
			print("we'll get him next time")
			$Visibility/flashlight.modulate=Color(1,1,1,.5)

func navigate(delta):
	var distance_to_destination = position.distance_to(path[0])
	destination = path[0]
	
	

	if distance_to_destination > nav_stop_threshold:
		
		move(delta)
			
	else:
		
		update_path()
	

func move(delta):
	
	
	motion = (destination-position).normalized() * speed
	
	if is_on_wall():
		make_path()
	collision_info = move_and_collide(motion * delta)
	
	
	
	
		
		
		

func make_path():
	var next_destination = possible_destinations[test_dest[i]]
	look_at(next_destination.global_position)
	if i < test_dest.size()-1: 
		i+=1
	else: 
		i=0
	path = navigation.get_simple_path(global_position, next_destination.global_position, true)
	
	
	
	
	
	
	


func update_path():
	if w_t==true:
		var t = Timer.new()
		t.set_wait_time(1)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		w_t=false
	else:
		if path.size() == 1:
			make_path()
			
		else:	
			path.remove(0)
		w_t=true
	
	
	
	
	




	
