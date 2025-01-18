extends CanvasLayer

signal start_remember

var complexity:int
var list_size:int

var tmp_result:int
var tmp_expression:String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#new_challenge()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_list_size(p_list_size:int) -> void:
	list_size = p_list_size

func set_complexity(p_complexity:int) -> void:
	complexity = p_complexity #+1

func new_challenge() -> String:
	# setup
	var num_size = 1
	if complexity >= 3:
		num_size = 2
	if complexity == 5:
		num_size = 3
	
	var operator = 1
	if complexity == 1 || complexity == 3 || complexity == 5 :
		operator = 2
	if complexity == 2 || complexity == 4 :
		operator = 3
	
	var val1:int = randi() % (10**num_size)
	var val2:int = randi() % (10**num_size)
	var val3:String = "!"
	#print_debug("complexity ", complexity)
	#print_debug("val1 : " ,val1)
	#print_debug("val2 : " ,val2)
	#print_debug("list_size : " ,list_size)
	if list_size <= 0:
		print_debug("go to recall page")
		emit_signal("start_remember")
	
	# avoiding negative numbers as a result of a substraction 
	# because the godot keyboard does not support it
	if val2 > val1 :
		var tmp = val1
		val1 = val2
		val2 = tmp
	
	list_size = list_size - 1
	
	match randi() % operator:
		0:
			val3 = " + "
			tmp_result = val1 + val2
			tmp_expression = str(val1) + val3 + str(val2)
		1:
			val3 = " - "
			tmp_result = val1 - val2
			tmp_expression = str(val1) + val3 + str(val2)
		2:
			val3 = " x "
			tmp_result = val1 * val2
			tmp_expression = str(val1) + val3 + str(val2)
		3:
			val3 = " / "
			tmp_result = val1 / val2
			tmp_expression = str(val1) + val3 + str(val2)
	
	if val3 == "!":
		print_debug("no operator match found!!")
	
	$ChallengeLabel.set_text(tmp_expression)
	$SolutionLineEdit.set_text("")
	
	return tmp_expression

func atemp_challenge() -> void:
	var p_result:int = int($SolutionLineEdit.get_text())
	if p_result == tmp_result:
		$ResultLabel.set_text("good job! keep up\nwith the good work!")
		new_challenge()
	else:
		$ResultLabel.set_text("hooo so close!\n(bopit to start!)")
	pass
