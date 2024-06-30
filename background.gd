extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$uwu.modulate = Color(abs(sin(PI / 180 * Global.frame * 1.5)), abs(sin(PI / 180 * Global.frame * 1.5)), abs(sin(PI / 180 * Global.frame * 1.5)))
	pass
