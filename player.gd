extends RigidBody2D

var velocity:Vector2
var gravity_flag:int = 0
var speed:float = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float):
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if gravity_flag == 0:
		Global.player_pos += velocity.normalized() * speed * delta
		if Global.player_pos.x < -640:
			Global.player_pos.x = -640
		if Global.player_pos.x > 640:
			Global.player_pos.x = 640
		if Global.player_pos.y < -480:
			Global.player_pos.y = -480
		if Global.player_pos.y > 480:
			Global.player_pos.y = 480
		position = Global.player_pos
		rotation = 0
		scale = Vector2(1, 1)
	pass

