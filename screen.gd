extends RigidBody2D

var gravity_flag:int = 0
var rotzero_flag:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ui_back.rotation = 0
	$player.rotation = 0
	if gravity_flag == 0:
		position = Vector2(640, 480)
	if rotzero_flag == 1:
		rotation = 0
	pass
