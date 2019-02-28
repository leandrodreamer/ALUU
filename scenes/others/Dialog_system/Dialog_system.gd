extends CanvasLayer

export var text_size = 40
export var text_speed = 1.0
export var text = []
var actual_step = 0
var enabled_mode = false


func _start_dialog(text_array=[""],t_size=40,t_speed=1.0): #inicia dialogo (con esta funcion debes llamarlo)
	text_size = t_size
	text_speed = t_speed
	text = text_array
	_run_dialog()

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and enabled_mode:
		_run_dialog()

func _run_dialog():
	actual_step += 1
	if actual_step > text.size(): #detecta final de dialogo
		actual_step = 0
		get_tree().paused = false
		$open_close.play("close")
		enabled_mode = false
	else: #marca cada paso del dialogo
		if actual_step == 1: #detecta inicio de dialogo
			get_tree().paused = true
			$open_close.play("open")
			enabled_mode = true
		$text_anim.playback_speed = text_speed
		$text_anim.play("text_avance")
		$box/Label.get_font("font").size = text_size
		$box/Label.text = tr(str(text[actual_step-1]))

