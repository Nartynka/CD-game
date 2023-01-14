extends CanvasLayer

signal note_collected
@onready var label = $Label
var notes_collected = 0 : set = set_notes

func _ready():
	connect("note_collected",Callable(self,"_on_note_collected"))

func _on_note_collected():
	self.notes_collected += 1

func set_notes(new_value):
	notes_collected = new_value
	label.text = str(notes_collected)+"/10"
