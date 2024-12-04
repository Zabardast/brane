extends CanvasLayer

signal start_math

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#for node in get_tree().get_nodes_in_group("hidable_memory"):
		#node.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _start_math_step() -> void:
	emit_signal("start_math")
	pass
