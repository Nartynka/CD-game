extends Node2D

onready var fader = $CanvasLayer/Fader
#405d80
func _ready():
	$YSort/Girl.connect("quest_complete", self, "_on_quest_completed")
	fader.connect("fade_finished", $YSort/Girl, "start")
	fader.fade_in()

func _on_quest_completed():
	$CanvasModulate.color = Color("ffffff")

func _input(event):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen 
	
