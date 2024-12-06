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
	complexity = p_complexity

func new_challenge() -> String:
	var val1:int = randi() % (complexity*10)
	var val2:int = randi() % (complexity*10)
	var val3:String = "!"
	list_size = list_size - 1
	#print_debug("complexity ", complexity)
	#print_debug("val1 : " ,val1)
	#print_debug("val2 : " ,val2)
	print_debug("list_size : " ,list_size)
	if list_size <= 0:
		print_debug("go to recall page")
		emit_signal("start_remember")
	
	# operator
	match randi() % 3:
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
	
	return tmp_expression

func atemp_challenge() -> void:
	var p_result:int = int($SolutionLineEdit.get_text())
	if p_result == tmp_result:
		$ResultLabel.set_text("good job! keep up with the good work!")
		new_challenge()
	else:
		$ResultLabel.set_text("hooo so close! (bopit to start!)")
	pass
