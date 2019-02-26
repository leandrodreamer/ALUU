extends Node2D#FEWJUMPS_PLAYER

const UP = Vector2(0,-1)
var _motion = Vector2()
var _speed = 700
var _gravity = 40
var _jumpHeight = -1300
var _jumps = 0

func _ready():	
	pass

func _process(delta):		
	controls()
	
func controls():
	_motion.y += _gravity
	if Input.is_action_pressed("ui_right"):
		_motion.x = _speed
	elif Input.is_action_pressed("ui_left"):
		_motion.x = -_speed
	else: _motion.x = 0
	
	if is_on_floor():
		_gravity = 40
		if Input.is_action_pressed("ui_a"):
			_motion.y = _jumpHeight
			$jump.play()
			if !$AnimationPlayer.is_playing():
				$AnimationPlayer.play("jumping")											
			_jumps+=1
			print(str(_jumps))
			_gravity = 60			
	_motion = move_and_slide(_motion,UP)
	
func GetJumps():
	return _jumps
	