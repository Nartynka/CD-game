extends StaticBody2D

var talked = false
signal quest_complete

func _ready():
	$AnimationPlayer.play("start")
	get_tree().paused = true

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept") and !talked:
		talked = true
		$AnimationPlayer.play("end")
		get_tree().paused = false
	elif Input.is_action_just_pressed("ui_accept") and Ui.notes_collected == 10:
		print("aaaaaa")
		$Balloon/VBox/Dialogue.text = "You saved the world!"
		get_tree().paused = true
		$AnimationPlayer.play("start")
		talked = false
		emit_signal("quest_complete")
