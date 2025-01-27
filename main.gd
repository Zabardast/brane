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
	$Memory.connect("start_challenge", Callable(self, "_start_challenge"))
	
	$ChallengeLoop.hide()
	$ChallengeLoop.connect("start_remember", Callable(self, "_start_remember"))
	
	$Remember.hide()
	$Remember.connect("test_remember", Callable(self, "_try_remember"))
	$Remember.connect("forgot", Callable(self, "_forgot_remember"))


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
	print("random number size :", p_size)
	return randi() % (10**(p_size))

func _start_challenge() -> void:
	$Memory.hide()
	print("challenge_loop start")
	$ChallengeLoop.set_list_size(list_size)
	$ChallengeLoop.set_complexity(complexity)
	$ChallengeLoop.new_challenge()
	$ChallengeLoop/ResultLabel.set_text("")
	$Remember/Label.set_text("")
	$ChallengeLoop.show()
	pass

func _start_remember() -> void:
	$ChallengeLoop.hide()
	print("remember start")
	$Remember/LineEdit.set_text("")
	$Remember/Label.set_text("")
	$Remember.show()
	pass

func _try_remember(p_val: String) -> void:
	print(p_val)
	if memory_number == int(p_val):
		print("correct!!")
		$Remember/Label.set_text("")
		$Remember.hide()
		$Menu.show()
		$PopupPanel.popup_centered()
	else :
		print("Not correct!!")
		$Remember/Label.set_text("Wouptidou!")
	pass

func _hide_popup() -> void:
	$PopupPanel.hide()

func _forgot_remember() -> void:
	print("main forgot")
	$Remember.hide()
	$Menu.show()

# TODO remove and pass data in the start game signal

func _menu_set_number_size(p_val: int) -> void:
	print("number size ", p_val)
	number_size = p_val + 1 # I should have a list and get the value from there 
	
func _menu_set_list_size(p_val: int) -> void:
	print("list size ", p_val)
	list_size = p_val + 1

func _menu_set_complexity(p_val: int) -> void:
	print("complexity ", p_val)
	complexity = p_val + 1
