extends Node2D

@onready var fader = $CanvasLayer/Fader
#405d80
func _ready():
	$Girl.connect("quest_complete",Callable(self,"_on_quest_completed"))
	fader.connect("fade_finished",Callable($Girl,"start"))
	fader.fade_in()

func _on_quest_completed():
	$CanvasModulate.color = Color("ffffff")
	get_tree().paused = false

func _input(event):
	if Input.is_action_just_pressed("fullscreen"):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
