extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_difficulty()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func difficulty_levels() -> Dictionary:
	return{
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
	#var memory_size_list : Array = [1,2,3,4,5,6] # amount of numbers to memorize
	#var problem_list_size : Array = [1,2,3,4,5,6] # amount of math problems to solve
	#var problem_complexity : Array = [1,2,3,4,5,6] # complexity of the math problems
	
	var memory_size_list : Dictionary = difficulty_levels() # amount of numbers to memorize
	var problem_list_size : Dictionary = difficulty_levels() # amount of math problems to solve
	var problem_complexity : Dictionary = difficulty_levels() # complexity of the math problems
	
	$NumberSizeContainer/OptionButton.clear()
	$ListSizeContainer/OptionButton.clear()
	$ComplexityContainer/OptionButton.clear()
	
	#add numberSize options
	for i in memory_size_list:
		$NumberSizeContainer/OptionButton.add_item(memory_size_list[i].label, i)
	
	#add listsize
	for i in problem_list_size:
		$ListSizeContainer/OptionButton.add_item(problem_list_size[i].label, i)
	
	#add complexity
	for i in problem_complexity:
		$ComplexityContainer/OptionButton.add_item(problem_complexity[i].label, i)
