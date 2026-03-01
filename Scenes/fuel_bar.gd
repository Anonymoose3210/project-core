extends Control

@onready var color_rect: ColorRect = $ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventController.connect("fuel_changed", on_event_fuel_changed)


func on_event_fuel_changed(value: int) :
	pass
