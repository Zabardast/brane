extends CanvasLayer

signal start_game
signal menu_set_number_size(size: int)
signal menu_set_list_size(size: int)
signal menu_set_complexity(complexity: int)

func _ready() -> void:
	set_difficulty()
	set_saved_config()

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
	
	var memory_size_list : Dictionary = difficulty_levels() # amount of numbers to memorize
	var problem_list_size : Dictionary = difficulty_levels() # amount of math problems to solve
	var problem_complexity : Dictionary = difficulty_levels() # complexity of the math problems
	
	$GridContainer/NumberSizeContainer/OptionButton.clear()
	$GridContainer/ListSizeContainer/OptionButton.clear()
	$GridContainer/ComplexityContainer/OptionButton.clear()
	
	var config = ConfigFile.new()
	var err = config.load("user://config.cfg")
	
	for i in memory_size_list:
		$GridContainer/NumberSizeContainer/OptionButton.add_item(memory_size_list[i].label, i)
	
	for i in problem_list_size:
		$GridContainer/ListSizeContainer/OptionButton.add_item(problem_list_size[i].label, i)
	
	for i in problem_complexity:
		$GridContainer/ComplexityContainer/OptionButton.add_item(problem_complexity[i].label, i)
	
	if err != OK:
		# memory_size_lsit
		$GridContainer/NumberSizeContainer/OptionButton.select(3)
		# problem_list_size
		$GridContainer/ListSizeContainer/OptionButton.select(0)
		# problem_complexity
		$GridContainer/ComplexityContainer/OptionButton.select(0)
	else : # set saved values
		$GridContainer/NumberSizeContainer/OptionButton.select(config.get_value("conf", "mem_size"))
		$GridContainer/ListSizeContainer/OptionButton.select(config.get_value("conf", "prblm_lst_size"))
		$GridContainer/ComplexityContainer/OptionButton.select(config.get_value("conf", "prblm_cmplexity"))

func set_saved_config() -> void:
	var config = ConfigFile.new()
	var err = config.load("user://config.cfg")
	if err != OK:
		return
	$GridContainer/NumberSizeContainer/OptionButton.select(config.get_value("conf", "mem_size"))
	$GridContainer/ListSizeContainer/OptionButton.select(config.get_value("conf", "prblm_lst_size"))
	$GridContainer/ComplexityContainer/OptionButton.select(config.get_value("conf", "prblm_cmplexity"))

func save_config() -> void:
	var config = ConfigFile.new()
	config.set_value("conf","mem_size", $GridContainer/NumberSizeContainer/OptionButton.get_selected())
	config.set_value("conf","prblm_lst_size", $GridContainer/ListSizeContainer/OptionButton.get_selected())
	config.set_value("conf","prblm_cmplexity", $GridContainer/ComplexityContainer/OptionButton.get_selected())
	config.save("user://config.cfg")

func start() -> void:
	# save config for next startup?
	save_config()
	# TODO: pass all data in one signal (use an object??)
	emit_signal("menu_set_number_size", $GridContainer/NumberSizeContainer/OptionButton.get_selected())
	emit_signal("menu_set_list_size", $GridContainer/ListSizeContainer/OptionButton.get_selected())
	emit_signal("menu_set_complexity", $GridContainer/ComplexityContainer/OptionButton.get_selected())
	emit_signal("start_game")
