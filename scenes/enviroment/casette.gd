extends StaticBody2D #CASSETE

# class member variables go here, for example:

export var _unlockCost = 0
export var _pixels = 32
export var _name = "Un Nombre"
export var _minigamePath = ""
export var _bg = "000"
export var _bg1 = "fff0e8"
export var _bg2 = "fff0e8"
export var _bg3 = "fff0e8"
export var _bg3_a = "fff0e8"
export var _bg4 = "fff0e8"
export var _bg4_a = "fff0e8"
export var _bg5 = "fff0e8"
export var _bg5_a = "fff0e8"
export var _bg6 = "fff0e8"
export var _bg6_a = "fff0e8"
export var _bg7 = "fff0e8"
export var _bg8 = "fff0e8"
export var _bg9 = "fff0e8"
export var _bg9_a = "fff0e8"

#PROPIEDADES
var _unlocked = true

func _ready():
	$txt_bits.text = str(_pixels)
	$txt_name.text = _name
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_previewMinigame_body_entered(body):
	pass # replace with function body

func _on_enterMinigame_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene(_minigamePath)
		print("asasas")	
		
		
		
		
		
		
