extends Node

var number_size: int
var list_size: int
var complexity: int

func _ready() -> void:
	var menu = $Menu
	print_debug("Menu class:", menu.get_class())
	menu.connect("start_game", Callable(self, "_start_game"))
	menu.connect("menu_set_number_size", Callable(self, "_menu_set_number_size"))
	menu.connect("menu_set_list_size", Callable(self, "_menu_set_list_size"))
	menu.connect("menu_set_complexity", Callable(self, "_menu_set_complexity"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func _start_game() -> void:
	print("start the game!")
	print("memo size: ", number_size)
	print("list size: ", list_size)
	print("complexity: ", complexity)
	#pass

func _menu_set_number_size(p_val: int) -> void:
	print("number size ", p_val)
	number_size = p_val
	
func _menu_set_list_size(p_val: int) -> void:
	print("list size ", p_val)
	list_size = p_val

func _menu_set_complexity(p_val: int) -> void:
	print("complexity ", p_val)
	complexity = p_val
