extends Node

var number_size: int
var list_size: int
var complexity: int

var memory_number: int

func _ready() -> void:
	randomize()
	var menu = $Menu
	print_debug("Menu class:", menu.get_class())
	menu.connect("start_game", Callable(self, "_start_game"))
	menu.connect("menu_set_number_size", Callable(self, "_menu_set_number_size"))
	menu.connect("menu_set_list_size", Callable(self, "_menu_set_list_size"))
	menu.connect("menu_set_complexity", Callable(self, "_menu_set_complexity"))
	
	$Memory.hide()
	$Memory.connect("start_math", Callable(self, "_start_math"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func _start_game() -> void:
	print("start the game!")
	print("memo size: ", number_size)
	print("list size: ", list_size)
	print("complexity: ", complexity)
	$Menu.hide()
	print("first step is memorizing")
	start_memorizing()

func start_memorizing() -> void:
	# populate memory with information
	memory_number = get_random_number(number_size)
	print("memory_number: ", memory_number)
	$Memory/Label.set_text(str(memory_number))
	$Memory.show()
	pass

func get_random_number(p_size: int) -> int:
	# for some reason to the power is ** and not ^
	return randi() % ((10**p_size)-1)

func _start_math() -> void:
	$Memory.hide()
	pass


# TODO remove and pass data in the start game signal

func _menu_set_number_size(p_val: int) -> void:
	#print("number size ", p_val)
	number_size = p_val
	
func _menu_set_list_size(p_val: int) -> void:
	#print("list size ", p_val)
	list_size = p_val

func _menu_set_complexity(p_val: int) -> void:
	#print("complexity ", p_val)
	complexity = p_val
