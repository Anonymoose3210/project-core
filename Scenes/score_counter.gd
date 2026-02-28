extends Control

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventController.connect("item_collected", on_event_item_collected)
	
func on_event_item_collected(score: int):
	label.text = str(score)
