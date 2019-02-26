extends Label 

func _ready():
	get_node("res://Scripts/global")

func _process(delta):
    global.time_now = OS.get_unix_time()
    var elapsed = global.time_now - global.time_start
    var minutes = elapsed / 60
    var seconds = elapsed % 60
    global.str_elapsed = "%02d : %02d" % [minutes, seconds]
    set_text(global.str_elapsed)