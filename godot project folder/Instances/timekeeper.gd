extends Label 

func _ready():
	pass


#this calculates the time that has passed in milliseconds, seconds, and minutes
#currently broken in its current form as it starts counting in the menus before the game starts
#variables with global before them can be found in global.gd
func _process(delta):
    global.time_now = OS.get_unix_time()
    global.millisec_now = OS.get_ticks_msec()
    var elapsed = global.time_now - global.time_start
    var minutes = elapsed / 60
    var seconds = elapsed % 60
    var milliseconds = global.millisec_now % 1000
    global.str_elapsed = "%02d : %02d . %02d" % [minutes, seconds, milliseconds]
    set_text(global.str_elapsed)
