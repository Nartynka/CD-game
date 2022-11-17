extends StaticBody2D

var talked = false
signal quest_complete
func start():
	$AnimationPlayer.play("start")
	get_tree().paused = true

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_accept") and !talked:
		talked = true
		$AnimationPlayer.play("end")
		get_tree().paused = false
	elif Input.is_action_just_pressed("ui_accept") and Ui.notes_collected == 10:
		$Balloon/VBox/Dialogue.text = "You saved the world!"
		$AnimationPlayer.play("start")
		get_tree().paused = true
		talked = false
		emit_signal("quest_complete")
