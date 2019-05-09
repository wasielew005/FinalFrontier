extends KinematicBody2D

var motion = Vector2()

onready var player = get_parent().get_node("Player")
onready var projectile_speed = get_parent().get_node("andrew_boss").projectile_speed
onready var wallone = get_parent().get_node("decayingwall")
onready var walltwo = get_parent().get_node("decayingwall2")
onready var wallthree = get_parent().get_node("decayingwall3")

var next_destination


func _ready():
	set_process(true)
	next_destination = player.global_position
	look_at(next_destination)
	motion = Vector2(projectile_speed, 0).rotated(rotation)




func _process(delta):
	
	var collision_info = move_and_collide(motion)
	if collision_info:
		if collision_info.collider == player:
			global.playerHealth -= 1
			$body.disabled = true
			self.visible = false
			global.speed = global.speed / 3
			print("You have been slowed")
			var t = Timer.new()
			t.set_wait_time(3)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			global.speed = global.speed * 3
			print(global.playerHealth)
		
		if collision_info.collider == wallone:
			wallone.health-= 1
			$body.disabled = true
			self.visible = false
		
		if collision_info.collider == walltwo:
			walltwo.health-= 1
			$body.disabled = true
			self.visible = false
		
		if collision_info.collider == wallthree:
			wallthree.health-= 1
			$body.disabled = true
			self.visible = false
			
		queue_free()

