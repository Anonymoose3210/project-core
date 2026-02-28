extends Node

var total_points = 0

func item_collected(item_value: int):
	total_points += item_value
	EventController.emit_signal("item_collected", total_points)
