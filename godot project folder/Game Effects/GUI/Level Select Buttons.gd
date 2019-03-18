extends VBoxContainer

export (NodePath) var dropdown_path_one
onready var dropdown_one = get_node(dropdown_path_one)

export (NodePath) var dropdown_path_two
onready var dropdown_two = get_node(dropdown_path_two)

export (NodePath) var dropdown_path_three
onready var dropdown_three = get_node(dropdown_path_three)

export (NodePath) var dropdown_path_four
onready var dropdown_four = get_node(dropdown_path_four)

export (NodePath) var dropdown_path_five
onready var dropdown_five = get_node(dropdown_path_five)

export (NodePath) var dropdown_path_six
onready var dropdown_six = get_node(dropdown_path_six)

var listItemsArray = ["One", "Two", "Three", "Four", "Five", "Six"]

func _ready():
	
	add_items()
	dropdown_one.connect("item_selected", self, "on_item_selected")
	dropdown_two.connect("item_selected", self, "on_item_selected")
	dropdown_three.connect("item_selected", self, "on_item_selected")
	dropdown_four.connect("item_selected", self, "on_item_selected")
	dropdown_five.connect("item_selected", self, "on_item_selected")
	dropdown_six.connect("item_selected", self, "on_item_selected")
	pass

func add_items():
	var size = listItemsArray.size()
	
	dropdown_one.add_item("Hello")
	

func update_buttons(id):
	#get id, remove from array, clear buttons, add_items
	#listItemsArray.remove(id)
	
	#for items in listItemsArray.size():
	#	set_buttons_disabled(items)
	
	for items in listItemsArray.size(): #size is 5
		clear_buttons(items)
		print(items)
	
	add_items(listItemsArray.size())

func clear_buttons(size):
	dropdown_one.clear()
	pass

func on_item_selected(id):
	update_buttons(id)
	print(str(dropdown_one.get_item_text(id)))
