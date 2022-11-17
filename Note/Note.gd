extends Area2D

signal note_collected

func _ready():
	randomize()
	$Sprite.frame = rand_range(0, 9)

func _on_Note_body_entered(body):
	if body is Player:
		Ui.emit_signal("note_collected")
		queue_free()
