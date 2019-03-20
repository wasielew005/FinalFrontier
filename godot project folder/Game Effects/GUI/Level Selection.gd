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
var selectedList = ["0", "1", "2", "3", "4", "5"]

var selectedOne = 0
var selectedTwo = 0
var selectedThree = 0
var selectedFour = 0
var selectedFive = 0
var selectedSix = 0

###########################################################
### change selectedList defining variables in each option
### button to correct path
### ex: selectedList[0] = "res://LevelOne.tscn"
### instead of selectedList[0] = ID

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

func disableOptions_if(ID, number):
	var dropdown_name
	
	var selected_name = determine_SelectedName(number)
	
	var dropdown_array = determine_DropdownButtons(number)
	for x in dropdown_array.size():
		dropdown_array[x].set_item_disabled(ID, true)
		dropdown_array[x].set_item_disabled(selected_name, false)
	
	pass

func disableOptions_else(ID, number):
	var dropdown_name
	
	var selected_name = determine_SelectedName(number)
	
	var dropdown_array = determine_DropdownButtons(number)
	for x in dropdown_array.size():
		dropdown_array[x].set_item_disabled(ID, true)
	
	pass

func determine_SelectedName(number):
	var selected_name
	
	match number:
		1:
			selected_name = selectedOne
		2:
			selected_name = selectedTwo
		3:
			selected_name = selectedThree
		4:
			selected_name = selectedFour
		5:
			selected_name = selectedFive
		6: 
			selected_name = selectedSix
	
	return selected_name

func determine_DropdownButtons(number):
	var dropdown_array
	
	match number:
		1:
			dropdown_array = [dropdown_two, dropdown_three, dropdown_four, dropdown_five, dropdown_six]
		2:
			dropdown_array = [dropdown_one, dropdown_three, dropdown_four, dropdown_five, dropdown_six]
		3:
			dropdown_array = [dropdown_one, dropdown_two, dropdown_four, dropdown_five, dropdown_six]
		4:
			dropdown_array = [dropdown_one, dropdown_two, dropdown_three, dropdown_five, dropdown_six]
		5:
			dropdown_array = [dropdown_one, dropdown_two, dropdown_three, dropdown_four, dropdown_six]
		6: 
			dropdown_array = [dropdown_one, dropdown_two, dropdown_three, dropdown_four, dropdown_five]
	
	return dropdown_array

#option buttons logic
#disables option if it's been selected by another button
#re-enabled option if the selection for a button is changed

func _on_OptionButton1_item_selected(ID):
	if ID != selectedOne or 0:
		disableOptions_if(ID, 1)
		selectedOne = ID
		selectedList[0] = ID
	
	else:
		disableOptions_else(ID, 1)
		selectedOne = ID
		selectedList[0] = ID

func _on_OptionButton2_item_selected(ID):
	if ID != selectedTwo or 0:
		disableOptions_if(ID, 2)
		selectedTwo = ID
		selectedList[1] = ID
	
	else:
		disableOptions_else(ID, 2)
		selectedTwo = ID
		selectedList[1] = ID

func _on_OptionButton3_item_selected(ID):
	if ID != selectedThree or 0:
		disableOptions_if(ID, 3)
		selectedThree = ID
		selectedList[2] = ID
	
	else:
		disableOptions_else(ID, 3)
		selectedThree = ID
		selectedList[2] = ID

func _on_OptionButton4_item_selected(ID):
	if ID != selectedFour or 0:
		disableOptions_if(ID, 4)
		selectedFour = ID
		selectedList[3] = ID
		
	else:
		disableOptions_else(ID, 4)
		selectedFour = ID
		selectedList[3] = ID

func _on_OptionButton5_item_selected(ID):
	if ID != selectedFive or 0:
		disableOptions_if(ID, 5)
		selectedFive = ID
		selectedList[4] = ID
	
	else:
		disableOptions_else(ID, 5)
		selectedFive = ID
		selectedList[4] = ID

func _on_OptionButton6_item_selected(ID):
	if ID != selectedSix or 0:
		disableOptions_if(ID, 6)
		selectedSix = ID
		selectedList[5] = ID
	
	else:
		disableOptions_else(ID, 6)
		selectedSix = ID
		selectedList[5] = ID

func save():
	print("Called Level Selection save.")
	var save_data = {
			"level_order": global.level_order,
			"current_level": 0,
			"filepath": "LevelOrder.save"
		}
	return save_data
