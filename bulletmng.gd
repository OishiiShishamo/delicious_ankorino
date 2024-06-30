extends RigidBody2D

var gravity_flag = 0
var bullet_flag:Array[int] = []
var bullet_position:Array[Vector2] = []
var bullet_velocity:Array[Vector2] = []
var bullet_angle:Array[float] = []
var bullet_size:Array[float] = []
var bullet_scale:Array[float] = []
var bullet_type:Array[int] = []
var bullet_color:Array[Color] = []
var bullet_speed:Array[float] = []
var bullet_curve:Array[float] = []
var bullet_curve_flag:Array[int] = []
var bullet_curve_frame:Array[int] = []
var bullet_endless_curve:Array[int] = []
var bullet_frame:Array[int] = []
var boss_pos:Vector2 = Vector2(0, -260)


# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_flag.resize(1024)
	bullet_position.resize(1024)
	bullet_velocity.resize(1024)
	bullet_speed.resize(1024)
	bullet_angle.resize(1024)
	bullet_size.resize(1024)
	bullet_scale.resize(1024)
	bullet_type.resize(1024)
	bullet_color.resize(1024)
	bullet_curve.resize(1024)
	bullet_curve_flag.resize(1024)
	bullet_curve_frame.resize(1024)
	bullet_endless_curve.resize(1024)
	bullet_frame.resize(1024)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	bullet_func()
	function(Global.frame)
	if gravity_flag == 0:
		rotation = 0
		position = Vector2(0, 0)
		scale = Vector2(1, 1)
	pass

func _draw():
	for i in bullet_flag:
		if i == 1:
			draw_circle(bullet_position[i], bullet_scale[i], bullet_color[i])
	pass

func bulletshot(position:Vector2, speed:float, angle:float, size:float, scale:float, type:int, color:Color, curve:float, curve_frame:int, endless_curve:int):
	var i = 0
	for oiocha in range(bullet_flag.size()):
		if bullet_flag[oiocha] == 0:
			i = oiocha
			break
	bullet_flag[i] = 1
	bullet_position[i] = position
	bullet_velocity[i] = Vector2(cos(angle), sin(angle))
	bullet_speed[i] = speed
	bullet_angle[i] = angle
	bullet_size[i] = size
	bullet_scale[i] = scale
	bullet_type[i] = type
	bullet_color[i] = color
	bullet_curve[i] = curve
	bullet_curve_flag[i] = 1
	bullet_curve_frame[i] = curve_frame
	bullet_endless_curve[i] = endless_curve
	bullet_frame[i] = 0
	pass

func barrage(position:Vector2, speed:float, angle:float, aim:int, spread:float, way:int, size:float, scale:float, type:int, color:Color, curve:float, curve_frame:int, endless_curve:int):
	if not spread == 0:
		match(aim):
			1:
				var aaaa = rad_to_deg(position.angle_to_point(Global.player_pos))
				aaaa -= spread / 2
				for i in range(way):
					aaaa += spread / way * i
					bulletshot(position, speed, deg_to_rad(angle + aaaa), 10, 15, 0, Color.RED, curve, curve_frame, endless_curve)
			2:
				var aaaa = rad_to_deg(position.angle_to_point(Global.player_pos)) + spread / way / 2
				aaaa -= spread / 2
				for i in range(way):
					aaaa += spread / way * i
					bulletshot(position, speed, deg_to_rad(angle + aaaa), 10, 15, 0, Color.RED, curve, curve_frame, endless_curve)
			_:
				var aaaa = spread / 2
				for i in range(way):
					aaaa += spread / way * i
					bulletshot(position, speed, deg_to_rad(angle + aaaa), 10, 15, 0, Color.RED, curve, curve_frame, endless_curve)
	else:
		match(aim):
			1:
				var aaaa = rad_to_deg(position.angle_to_point(Global.player_pos))
				for i in range(way):
					bulletshot(position, speed, deg_to_rad(angle + aaaa), 10, 15, 0, Color.RED, curve, curve_frame, endless_curve)
			2:
				var aaaa = rad_to_deg(position.angle_to_point(Global.player_pos)) + 0.5
				for i in range(way):
					bulletshot(position, speed, deg_to_rad(angle + aaaa), 10, 15, 0, Color.RED, curve, curve_frame, endless_curve)
			_:
				var aaaa = spread / 2
				for i in range(way):
					bulletshot(position, speed, deg_to_rad(angle + aaaa), 10, 15, 0, Color.RED, curve, curve_frame, endless_curve)
	pass
	
func bullet_func():
	for i in bullet_flag:
		if bullet_flag[i] == 1:
			bullet_frame[i] += 1
			match(bullet_type[i]):
				0:
					if bullet_frame[i] % bullet_curve_frame[i] == 0 and bullet_curve_flag[i] == 1:
						bullet_angle += bullet_curve
						if bullet_endless_curve[i] == 0:
							bullet_curve_flag[i] = 0
					bullet_velocity[i] = Vector2(cos(bullet_angle[i]), sin(bullet_angle[i]))
					bullet_position[i] += bullet_velocity[i] * 0.5# * bullet_speed[i]
					#print(bullet_velocity[i].x, "\n", bullet_velocity[i].y)
					#if Global.player_pos.distance_to(bullet_position[i]) <= bullet_size[i]:
						#get_tree().quit()
					if bullet_position[i].x <= -100:
						bullet_del(i)
					if bullet_position[i].x >= 1380:
						bullet_del(i)
					#if bullet_position[i].y <= -100:
						#bullet_del(i)
					if bullet_position[i].y >= 1060:
						bullet_del(i)
				_:
					if bullet_frame[i] % bullet_curve_frame[i] == 0 and bullet_curve_flag[i] == 1:
						bullet_angle += bullet_curve
						if bullet_endless_curve[i] == 0:
							bullet_curve_flag[i] = 0
					bullet_velocity[i] = Vector2(cos(bullet_angle[i]), sin(bullet_angle[i]))
					bullet_position[i] += bullet_velocity[i] * bullet_speed[i]
					if Global.player_pos.distance_to(bullet_position[i]) <= bullet_size[i]:
						get_tree().quit()
					if bullet_position[i].x <= -100:
						bullet_del(i)
					if bullet_position[i].x >= 1380:
						bullet_del(i)
					if bullet_position[i].y <= -100:
						bullet_del(i)
					if bullet_position[i].y >= 1060:
						bullet_del(i)
	pass

func bullet_del(num:int):
	bullet_flag[num] = 0
	pass

func crot(measure:float, beat:float, cro:float) -> int:
	var cro_one:float = Global.bpm / 16
	return cro_one * beat * measure + cro * cro_one
	pass

func function(f:int):
	if f == crot(4, 4, 0):
		barrage(boss_pos, 3, 0, 1, 0, 32, 20, 20, 0, Color.RED, 0, 1, 0)
	pass


