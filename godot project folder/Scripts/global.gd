extends Node

#timekeeper
var time_start = 0
var time_now = 0
var str_elapsed = ""
var millisec_now = 0


#gun score tracker
var value = 0


func _ready():
    time_start = OS.get_unix_time()
    set_process(true)


 