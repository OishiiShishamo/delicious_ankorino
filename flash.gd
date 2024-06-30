extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$light.modulate = Global.flash_color
	if Global.flash > 0:
		$light.modulate.a = (1.0 / Global.flash_decay) * Global.flash
		Global.flash -= Global.flash_red
	else:
		$light.modulate.a = 0
	pass
