extends RigidBody2D

var gravity_flag:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float):
	if gravity_flag == 0:
		rotation = 0
		position = Vector2(0, 0)
		scale = Vector2(1, 1)
	pass
