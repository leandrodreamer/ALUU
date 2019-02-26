extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _process(delta):
	$HUD/Container/lbl_scoreValue.text = str($player.GetJumps())

func _on_areaDie_body_entered(body):
	if body.is_in_group("player"):		
		get_tree().reload_current_scene()
