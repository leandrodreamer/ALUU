extends Node2D

export var text = []
export var distance = 200
export var text_speed = 1
export var text_size = 40
var active = true
export var auto_destroy = false

func _input(event):
	if Input.is_action_just_released("ui_accept") and active and global_position.distance_to(get_tree().get_nodes_in_group("player")[0].global_position) < distance: #agregar comprobacion de distancia a jugador
		active = false
		$reactive.start()
		Dialog_system._start_dialog(text,text_size,text_speed)
		if auto_destroy:
			queue_free()
		
func _on_reactive_timeout():
	active = true
