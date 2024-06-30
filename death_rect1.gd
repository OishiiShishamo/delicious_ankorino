extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	function(Global.frame)
	$polygon/CollisionPolygon2D.set_polygon($polygon.polygon)
	pass

func crot(measure:float, beat:float, cro:float) -> int:
	var cro_one:float = Global.bpm / 16
	return cro_one * beat * measure + cro * cro_one
	pass

func function(f):
	if f >= crot(0, 4, 0) and f <= crot(4, 4, 0):
		$polygon.set_polygon([Vector2(-640, -480), Vector2(-640, 480), Vector2(-640 + 640 / 240 * f, 480), Vector2(-640 + 640 / 240 * f, -480)])
		pass
	if f == crot(4, 4, 0):
		pass
	if f == crot(4, 4, 0.5):
		pass
	if f == crot(6, 4, 0):
		pass
	if f == crot(6, 4, 0.5):
		pass
	if f == crot(6, 4, 0):
		pass
	if f == crot(6, 4, 0.5):
		pass
	if f == crot(8, 4, 0):
		pass
	if f == crot(8, 4, 0.5):
		pass
	if f == crot(9, 4, 0):
		pass
	if f == crot(9, 4, 0.5):
		pass
	if f >= crot(10, 4, 0) and f <= crot(11, 4, 0):
		pass
	if f == crot(11, 4, 0):
		pass
	if f >= crot(11, 4, 0) and f <= crot(12, 4, 0):
		pass
	if f == crot(12, 4, 0):
		pass
	if f >= crot(12, 4, 0) and f <= crot(28, 4, 0):
		pass
	if f >= crot(28, 4, 0) and f <= crot(36, 4, 0):
		pass
	if f >= crot(36, 4, 0) and f <= crot(52, 4, 0):
		if f % 60 == 0:
			pass
		if f % 60 == 15:
			pass
		if f % 60 == 30:
			pass
		if f % 60 == 45:
			pass
	if f == crot(52, 4, 0):
		pass
	if f >= crot(52, 4, 0):
		pass
	pass





func _on_body_entered(body):
	var parent = body.get_parent()
	if body.name == "player":
		print("hoge")
	pass # Replace with function body.
