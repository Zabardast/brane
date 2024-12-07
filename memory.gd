extends CanvasLayer

signal start_challenge

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.set_text("")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _start_math_step() -> void:
	print_debug("_start_math_step")
	emit_signal("start_challenge")
	pass
