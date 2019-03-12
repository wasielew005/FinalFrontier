extends Node

#this script is used to assign vars that you don't want to be reset at scene change
#this script is global because it is set that way in the project settings



#timekeeper
var time_start = 0
var time_now = 0
var str_elapsed = ""
var millisec_now = 0

#Determines whether the character is reloading
var reloading = 0

#score tracker
var value = 0

#bullets
var ammo_in_weapon = 6

#starts the time counter. this needs to be changed so that it doesn't start in the menus
func _ready():
    time_start = OS.get_unix_time()
    set_process(true)


 
