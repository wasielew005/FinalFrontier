extends KinematicBody2D


var speed= 150
var motion = Vector2()

var path = []
var destination = Vector2()
var bounce = Vector2()
export (int) var targethealth = 10
export (int) var points = 9000
var w_t=false
var init_path=false
#var target
var collision_info





export var walk_slowdown = 0.5
export var nav_stop_threshold = 500
export (int) var destination_order= []
export var reverseOrder= true




onready var navigation = get_parent().get_node("Navigation2D");
onready var available_destinations = get_parent().get_node("Navigation2D/destinations");
onready var player= get_parent().get_node("Player")




func _ready():
	
	set_process(true)
	
	
	
	
	
	

	

func enemy_hit():
	targethealth -= global.playergundmg
	print(targethealth)
	if targethealth <= 0:
		get_parent().get_node("Player/GUI/Score").adjust(points)
		queue_free()

func _process(delta):
	if player.detected == true:
		visible = true
		if !init_path:	
			make_path()
			init_path=true
		navigate(delta)
	
	
	

func navigate(delta):
	var distance_to_destination = position.distance_to(path[0])
	destination = path[0]
	#print(destination)
	move(delta)
	if collision_info && collision_info.collider && collision_info.collider == player:
		global.playerHealth -= 1
		
		motion = motion.bounce(collision_info.normal)
		move_and_collide(motion * .3)
		
		if get_parent().get_node("Player/playerrifle").visible==true:
			get_parent().get_node("Player/playerrifle").visible = false
			get_parent().get_node("Player/player_rifle_damaged").visible=true
			
			var t = Timer.new()
			t.set_wait_time(0.05)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
			
			get_parent().get_node("Player/playerrifle").visible = true
			get_parent().get_node("Player/player_rifle_damaged").visible=false
			
		
		elif get_parent().get_node("Player/playerrevolver").visible==true:
			get_parent().get_node("Player/playerrevolver").visible = false
			get_parent().get_node("Player/player_revolver_damaged").visible=true
			
			var t = Timer.new()
			t.set_wait_time(0.05)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
			
			get_parent().get_node("Player/player_revolver_damaged").visible=false
			get_parent().get_node("Player/playerrevolver").visible = true
		
		
		
		
	
	
	
	update_path()
	
	

func move(delta):
	
	
	motion = Vector2(speed, 0).rotated(rotation) 
	#print(motion)
	if is_on_wall():
		make_path()
	collision_info = move_and_collide(motion*delta)
	
	
	
	
		
		
		

func make_path():
	
	var next_destination = player.global_position
	look_at(next_destination)
	path = navigation.get_simple_path(global_position, next_destination, true)
	
	
	
	
	
	
	


func update_path():
		if path.size() == 1:
			make_path()
			
		else:	
			path.remove(0)
		