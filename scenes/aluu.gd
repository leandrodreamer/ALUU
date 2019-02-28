extends KinematicBody2D #ALUU

# ATRIBUTOS
var _speed = 600
var _health = 100
var _power = 1
var _velocity = Vector2(0,0)
var _healthPotion = 0
var _healthPotionSprite = preload("res://assets/tiles/pico8/64px/orange.png")
var _speedPotion = 0
var _speedPotionSprite = preload("res://assets/tiles/pico8/64px/green.png")
var _powerPotion = 0
var _powerPotionSprite = preload("res://assets/tiles/pico8/64px/red.png")
var _selectedPotion = 1


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func controls_loop():
	var LEFT = Input.is_action_pressed('ui_left')
	var RIGHT = Input.is_action_pressed('ui_right')
	var UP = Input.is_action_pressed('ui_up')
	var DOWN = Input.is_action_pressed('ui_down')
	
	_velocity.x = -int(LEFT) + int(RIGHT)
	_velocity.y = -int(UP) + int(DOWN)
	
	if _velocity.x > 0: rotation_degrees=0
	if _velocity.x < 0: rotation_degrees=-180
	if _velocity.y > 0: rotation_degrees=90
	if _velocity.y < 0: rotation_degrees=-90
	
	if _velocity.x > 0 && _velocity.y > 0: rotation_degrees=45
	if _velocity.x > 0 && _velocity.y < 0: rotation_degrees=-45
	if _velocity.x < 0 && _velocity.y > 0: rotation_degrees=135
	if _velocity.x < 0 && _velocity.y < 0: rotation_degrees=-135
	
	if Input.is_action_just_pressed("ui_select"):
		if _selectedPotion == 1:
			_selectedPotion +=1
			$potion.texture= _speedPotionSprite
		elif _selectedPotion ==2:
			_selectedPotion += 1
			$potion.texture=_powerPotionSprite
		else:
			_selectedPotion=1
			$potion.texture=_healthPotionSprite
		
		print("Selected potion: "+ str(_selectedPotion))
		print("--------------")
	
	if Input.is_action_just_pressed("ui_b"):# x key
		usePotion(_selectedPotion)		
		
func movement_loop():
	var motion = _velocity.normalized() * _speed
	move_and_slide(motion,Vector2(0,0))
	
func _process(delta):
	controls_loop()
	movement_loop()
	
func usePotion(selectedPotion):
	match _selectedPotion:
		1: _health += 20
		2: _speed += 500
		3: _power += _power
	print("health: "+ str(_health))
	print("Speed: "+ str(_speed))
	print("Power: "+ str(_power))
	print("--------------")	
		
