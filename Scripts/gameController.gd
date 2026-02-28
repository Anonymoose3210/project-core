extends Node

var total_points = 0

func item_collected(item_value: int):
	total_points += item_value
	EventController.emit_signal("item_collected", total_points)

func game_ended():
	total_points = 0
	get_tree().reload_current_scene()
