extends Node2D

var default_window_position:Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	default_window_position = get_window().position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	function(Global.frame)
	Global.frame += 1
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	pass

func crot(measure:float, beat:float, cro:float) -> int:
	var cro_one:float = Global.bpm / 16
	return cro_one * beat * measure + cro * cro_one
	pass

func flash(flash:float, flash_decay:float, flash_red:float):
	Global.flash = flash
	Global.flash_decay = flash_decay
	Global.flash_red = flash_red

func flashc(flash:float, flash_decay:float, flash_red:float, flash_color:Color):
	Global.flash = flash
	Global.flash_decay = flash_decay
	Global.flash_red = flash_red
	Global.flash_color = flash_color

func function(f:int):
	if f == 0:
		flashc(crot(4, 4, 0), crot(4, 4, 0), 1, Color(0, 0, 0))
	if f == crot(4, 4, 0):
		$screen.rotation = PI / 16
	if f == crot(4, 4, 0.5):
		$screen.rotation = -PI / 16
	if f == crot(6, 4, 0):
		$screen.rotation = PI / 12
	if f == crot(6, 4, 0.5):
		$screen.rotation = -PI / 12
	if f == crot(6, 4, 0):
		$screen.rotation = PI / 8
	if f == crot(6, 4, 0.5):
		$screen.rotation = -PI / 8
	if f == crot(8, 4, 0):
		$screen.rotation = PI / 6
	if f == crot(8, 4, 0.5):
		$screen.rotation = -PI / 6
	if f == crot(9, 4, 0):
		$screen.rotation = PI / 4
	if f == crot(9, 4, 0.5):
		$screen.rotation = -PI / 4
	if f >= crot(10, 4, 0) and f <= crot(11, 4, 0):
		$screen.rotation = sin(PI / 180 * (f - crot(10, 4, 0)) * 3) * TAU
	if f == crot(11, 4, 0):
		$screen.gravity_scale = 5.0
		$screen.gravity_flag = 1
	if f >= crot(11, 4, 0) and f <= crot(12, 4, 0):
		$screen.rotation = sin(PI / 180 * (f - crot(11, 4, 0)) * 3) * TAU * 2
	if f == crot(12, 4, 0):
		flashc(crot(1, 4, 0), crot(1, 4, 0), 1, Color(0, 0, 0))
		$screen.gravity_scale = 0.0
		$screen.gravity_flag = 0
		$screen.rotzero_flag = 1
	if f >= crot(12, 4, 0) and f <= crot(28, 4, 0):
		get_window().position = default_window_position + Vector2i(sin(PI / 180 * (f - crot(12, 4, 0)) * 12) * 100, abs(sin(PI / 180 * (f - crot(12, 4, 0)) * 12)) * 50)
	if f >= crot(28, 4, 0) and f <= crot(36, 4, 0):
		get_window().position = default_window_position + Vector2i(sin(PI / 180 * (f - crot(12, 4, 0)) * 24) * 200, abs(sin(PI / 180 * (f - crot(12, 4, 0)) * 24)) * 100)
	if f >= crot(36, 4, 0) and f <= crot(52, 4, 0):
		if f % 60 == 0:
			get_window().position = default_window_position + Vector2i(-400, 0)
		if f % 60 == 15:
			get_window().position = default_window_position + Vector2i(-150, 0)
		if f % 60 == 30:
			get_window().position = default_window_position + Vector2i(150, 0)
		if f % 60 == 45:
			get_window().position = default_window_position + Vector2i(400, 0)
	if f == crot(52, 4, 0):
		get_window().position = default_window_position
		$window_gra.gravity_scale = 1.0
	if f >= crot(52, 4, 0):
		get_window().position = default_window_position + Vector2i($window_gra.position)
