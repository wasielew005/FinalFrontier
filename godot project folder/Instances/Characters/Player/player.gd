extends KinematicBody2D

#the speed var is multiplied by the velocity in the movement script to determine character speed
#exporting allows us to manipulate its value in the inspector window
#this exports the variable speed, and takes in an int from the inspector window
#export (int)
var speed = 200

#revolver_sound is created to be assigned to the sound node later
var revolver_sound

const MAX_AMMO_PISTOL = 6
const MAX_AMMO_RIFLE = 3

#if player is "alive" or "dead"
var player_state
signal game_over

var velocity = Vector2()


#the raycast for the pistol is prepared to be called when the user shoots
#the raycast is the "bullet" that will collide with other objects
onready var basicshootcast = get_node("basicshootcast")


#hit is defined as a signal here, used in the shoot function 
#the signal is connected to the level script and is used to play the hit animation
#the level script is currently named kylerstestarea.gd
signal hit
signal hit_vtarget
signal hit_htarget
signal hit_enemy

func _ready():
	set_process_input(true)
	#loads the sound for the gun to be used when the player clicks the shoot button
	#assigns the node "revolvershot" which holds the sound effects to the var revolver_shot created above
	revolver_sound = get_node("revolvershot")
	changeweapon()
	
	if global.isGameComplete == null:
		global.isGameComplete = false
	
	if global.playerHealth <= 0:
		death()
	
	player_state = "alive"


#Shooting - check for user input. trigger reloading
#vars with global before their names are defined in the global.gd script
#using global vars prevents them from resetting when changing scenes 
func _input(event):
	if event.is_action_pressed("left_click"):
		if global.ammo_in_weapon > 0:
			if global.reloading == 0:
				shoot()
				if global.MAX_AMMO == MAX_AMMO_PISTOL:
					global.ammo_in_pistol -= 1
					global.ammo_in_weapon = global.ammo_in_pistol
				if global.MAX_AMMO == MAX_AMMO_RIFLE:
					global.ammo_in_rifle -= 1
					global.ammo_in_weapon = global.ammo_in_rifle
				#single line below plays the gun sound everytime the player shoots 
				revolver_sound.play()
				$GUI/Ammo.update()
				#next two lines below auto reloads the gun if it is empty
				if global.MAX_AMMO == MAX_AMMO_PISTOL:
					if global.ammo_in_pistol == 0:
						reload()
				if global.MAX_AMMO == MAX_AMMO_RIFLE:
					if global.ammo_in_rifle == 0:
						reload()
	#if the player clicks the "reload" button, reload() is called if there are less than 6 bullets
	#reload is mapped to the "r" button in the project settings 
	if event.is_action_pressed("reload"):
		if global.MAX_AMMO == MAX_AMMO_PISTOL:
			if global.ammo_in_pistol < MAX_AMMO_PISTOL:
				reload()
		if global.MAX_AMMO == MAX_AMMO_RIFLE:
			if global.ammo_in_rifle < MAX_AMMO_RIFLE:
				reload()
			
	#the below is used to swap weapons
	if event.is_action_pressed("revolverswap"):
		global.visibleweapon = 1
		global.playergundmg = 1
		changeweapon()
	if event.is_action_pressed("rifleswap"):
		global.visibleweapon = 2
		global.playergundmg = 2
		changeweapon()

func changeweapon():
	if global.visibleweapon == 1:
		get_node("playerrevolver").visible=true
		get_node("playerrifle").visible=false
		global.ammo_in_weapon = global.ammo_in_pistol
		global.MAX_AMMO = MAX_AMMO_PISTOL
		$GUI/Ammo.update()
	if global.visibleweapon == 2:
		get_node("playerrevolver").visible=false
		get_node("playerrifle").visible=true
		global.ammo_in_weapon = global.ammo_in_rifle
		global.MAX_AMMO = MAX_AMMO_RIFLE
		$GUI/Ammo.update()



#check for collision when left_click is pressed. 
#if it collides with a designated group, it will add score.
func shoot():
	if basicshootcast.is_colliding():
		var collider = basicshootcast.get_collider()
		#sends the hit signal to the level script. currently kylerstestarea.gd
		emit_signal("hit", basicshootcast.get_collision_point())
		#the below lines check to see the raycast is colliding with certain groups
		#depending on the group, it adds a certain amount of points
		#groups can be set to certain nodes nodes in the Node window under Groups
		#the Node window uses the same window as the Inspector 
		if collider.is_in_group("enemy"):
			collider.enemy_hit()
			if abilities.double_damage:
				collider.enemy_hit()
		#if collider.is_in_group("vtarget"):
			#emit_signal("hit_vtarget", basicshootcast.get_collision_point())
		#if collider.is_in_group("htarget"):
			#emit_signal("hit_htarget", basicshootcast.get_collision_point())
		#if collider.is_in_group("enemy"):
			#emit_signal("hit_enemy", basicshootcast.get_collision_point())
			



#reload function that gets triggered in the left_click input event function 
#sets the ammo count to 6
#tells the hud to show the reloading indicator
#timer prevents the gun from instant reloading
#the update() function for this block is in reloadinglabel.gd
func reload():
	global.reloading = 1
	$GUI/Reloading.update()
	var t = Timer.new()
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	if get_node("playerrevolver").visible==true:
		global.ammo_in_pistol = 6
		global.ammo_in_weapon = global.ammo_in_pistol
	if get_node("playerrifle").visible==true:
		global.ammo_in_rifle = 3
		global.ammo_in_weapon = global.ammo_in_rifle
	$GUI/Ammo.update()
	global.reloading = 0
	$GUI/Reloading.update()

#this function is used for player movement. 
#movement in godot is grid based, so the key presses move the character on x ,y
func get_input():
	#the below line is what makes our character look at the mouse 
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
	#multiplies the velocity by the var "speed
	#speed is defined at the top of the script
    velocity = velocity.normalized() * speed

func respawn():
	#find last node checkpoint
	#getNode("last checkpoint node").spawn()
	#OR
	#load SaveData.file
	player_state = "alive"
	#set all relevant player items to what they were at checkpoint
	pass
	

func death():
	emit_signal("game_over")
	get_tree().paused = not get_tree().paused

func save():
	var save_data = {
			"ammo_in_weapon": global.ammo_in_weapon,
			"score": global.value,
			"saved_elapsed": global.elapsed,
			"difficulty": global.difficulty,
			"gameComplete": global.isGameComplete,
			"filepath": "Player.save"
		}
	return save_data

#tells the game to constantly check for user input
func _physics_process(delta):
    get_input()
    move_and_slide(velocity)