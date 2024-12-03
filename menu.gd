extends CanvasLayer

signal start_game
signal menu_set_number_size(size: int)
signal menu_set_list_size(size: int)
signal menu_set_complexity(complexity: int)

func _ready() -> void:
	set_difficulty()

func difficulty_levels() -> Dictionary:
	return{
		0: {
			"label": tr("0"),
			"value": 0
		},
		1: {
			"label": tr("1"),
			"value": 1
		},
		2: {
			"label": tr("2"),
			"value": 2
		},
		3: {
			"label": tr("3"),
			"value": 3
		},
		4: {
			"label": tr("4"),
			"value": 4
		},
		5: {
			"label": tr("5"),
			"value": 5
		},
		6: {
			"label": tr("6"),
			"value": 6
		},
	}

func set_difficulty() -> void:
	print_debug("set_difficulty :")
	
	var memory_size_list : Dictionary = difficulty_levels() # amount of numbers to memorize
	var problem_list_size : Dictionary = difficulty_levels() # amount of math problems to solve
	var problem_complexity : Dictionary = difficulty_levels() # complexity of the math problems
	
	$NumberSizeContainer/OptionButton.clear()
	$ListSizeContainer/OptionButton.clear()
	$ComplexityContainer/OptionButton.clear()
	
	for i in memory_size_list:
		$NumberSizeContainer/OptionButton.add_item(memory_size_list[i].label, i)
	$NumberSizeContainer/OptionButton.select(4)
	
	for i in problem_list_size:
		$ListSizeContainer/OptionButton.add_item(problem_list_size[i].label, i)
	$ListSizeContainer/OptionButton.select(2)
	
	for i in problem_complexity:
		$ComplexityContainer/OptionButton.add_item(problem_complexity[i].label, i)
	$ComplexityContainer/OptionButton.select(1)


func _on_number_size_selected(size: int) -> void:
	emit_signal("menu_set_number_size", size)
	pass

func _on_list_size_selected(size: int) -> void:
	emit_signal("menu_set_list_size", size)
	pass

func _on_complexity_selected(complexity: int) -> void:
	emit_signal("menu_set_complexity", complexity)
	pass


func start() -> void:
	emit_signal("start_game")
