extends VBoxContainer

export (NodePath) var dropdown_one_path
onready var dropdown_one = get_node(dropdown_one_path)

export (NodePath) var dropdown_two_path
onready var dropdown_two = get_node(dropdown_two_path)

export (NodePath) var dropdown_three_path
onready var dropdown_three = get_node(dropdown_three_path)

export (NodePath) var dropdown_four_path
onready var dropdown_four = get_node(dropdown_four_path)

export (NodePath) var dropdown_five_path
onready var dropdown_five = get_node(dropdown_five_path)

export (NodePath) var dropdown_six_path
onready var dropdown_six = get_node(dropdown_six_path)

var listOptionItems = ["Choose a level", "Level One", "Level Two", "Level Three", "Level Four", "Level Five", "Level Six"]
var selectedList

var selectedOne
var selectedTwo
var selectedThree
var selectedFour
var selectedFive
var selectedSix

###########################################################
### change selectedList defining variables in each option
### button to correct path
### ex: selectedList[0] = "res://LevelOne.tscn"

func _ready():
	if global.isGameComplete:
		self.show()
		add_items()
	else:
		self.hide()

func add_items():
	for x in listOptionItems:
		dropdown_one.add_item(x)
		dropdown_two.add_item(x)
		dropdown_three.add_item(x)
		dropdown_four.add_item(x)
		dropdown_five.add_item(x)
		dropdown_six.add_item(x)
	pass

func _on_OptionButton1_item_selected(ID):
	if ID == 0:
		dropdown_two.set_item_disabled(selectedOne, false)
		dropdown_three.set_item_disabled(selectedOne, false)
		dropdown_four.set_item_disabled(selectedOne, false)
		dropdown_five.set_item_disabled(selectedOne, false)
		dropdown_six.set_item_disabled(selectedOne, false)
	
	else:
		dropdown_two.set_item_disabled(ID, true)
		dropdown_three.set_item_disabled(ID, true)
		dropdown_four.set_item_disabled(ID, true)
		dropdown_five.set_item_disabled(ID, true)
		dropdown_six.set_item_disabled(ID, true)
		selectedOne = ID
		selectedList[0] = "Level One"


func _on_OptionButton2_item_selected(ID):
	if ID == 0:
		dropdown_one.set_item_disabled(selectedTwo, false)
		dropdown_three.set_item_disabled(selectedTwo, false)
		dropdown_four.set_item_disabled(selectedTwo, false)
		dropdown_five.set_item_disabled(selectedTwo, false)
		dropdown_six.set_item_disabled(selectedTwo, false)
	
	else:
		dropdown_one.set_item_disabled(ID, true)
		dropdown_three.set_item_disabled(ID, true)
		dropdown_four.set_item_disabled(ID, true)
		dropdown_five.set_item_disabled(ID, true)
		dropdown_six.set_item_disabled(ID, true)
		selectedTwo = ID
		selectedList[1] = "Level Two"


func _on_OptionButton3_item_selected(ID):
	if ID == 0:
		dropdown_one.set_item_disabled(selectedThree, false)
		dropdown_two.set_item_disabled(selectedThree, false)
		dropdown_four.set_item_disabled(selectedThree, false)
		dropdown_five.set_item_disabled(selectedThree, false)
		dropdown_six.set_item_disabled(selectedThree, false)
	
	else:
		dropdown_one.set_item_disabled(ID, true)
		dropdown_two.set_item_disabled(ID, true)
		dropdown_four.set_item_disabled(ID, true)
		dropdown_five.set_item_disabled(ID, true)
		dropdown_six.set_item_disabled(ID, true)
		selectedThree = ID
		selectedList[2] = "Level Three"


func _on_OptionButton4_item_selected(ID):
	if ID == 0:
		dropdown_one.set_item_disabled(selectedFour, false)
		dropdown_two.set_item_disabled(selectedFour, false)
		dropdown_three.set_item_disabled(selectedFour, false)
		dropdown_five.set_item_disabled(selectedFour, false)
		dropdown_six.set_item_disabled(selectedFour, false)
		
	else:
		dropdown_one.set_item_disabled(ID, true)
		dropdown_two.set_item_disabled(ID, true)
		dropdown_three.set_item_disabled(ID, true)
		dropdown_five.set_item_disabled(ID, true)
		dropdown_six.set_item_disabled(ID, true)
		selectedFour = ID
		selectedList[3] = "Level Four"


func _on_OptionButton5_item_selected(ID):
	if ID == 0:
		dropdown_one.set_item_disabled(selectedFive, false)
		dropdown_two.set_item_disabled(selectedFive, false)
		dropdown_three.set_item_disabled(selectedFive, false)
		dropdown_four.set_item_disabled(selectedFive, false)
		dropdown_six.set_item_disabled(selectedFive, false)
	
	else:
		dropdown_one.set_item_disabled(ID, true)
		dropdown_two.set_item_disabled(ID, true)
		dropdown_three.set_item_disabled(ID, true)
		dropdown_four.set_item_disabled(ID, true)
		dropdown_six.set_item_disabled(ID, true)
		selectedFive = ID
		selectedList[4] = "Level Five"


func _on_OptionButton6_item_selected(ID):
	if ID == 0:
		dropdown_one.set_item_disabled(selectedSix, false)
		dropdown_two.set_item_disabled(selectedSix, false)
		dropdown_three.set_item_disabled(selectedSix, false)
		dropdown_four.set_item_disabled(selectedSix, false)
		dropdown_five.set_item_disabled(selectedSix, false)
	
	else:
		dropdown_one.set_item_disabled(ID, true)
		dropdown_two.set_item_disabled(ID, true)
		dropdown_three.set_item_disabled(ID, true)
		dropdown_four.set_item_disabled(ID, true)
		dropdown_five.set_item_disabled(ID, true)
		selectedSix = ID
		selectedList[5] = "Level Six"


func _on_StartGameButton_pressed():
	#save.save_game()
	#global.level_order = selected_list
	#get_tree().change_scene(selected_list[0])
	pass

#func save():
#	var save_data = {
#			"level_order": selected_list,
#			"filepath": "LevelOrder.save"
#		}
#	return save_data
