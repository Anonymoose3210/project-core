extends Node

var total_points = 0
var high_score = 0
var total_fuel = 10

func item_collected(item_value: int):
	total_points += item_value
	EventController.emit_signal("item_collected", total_points)

func game_ended():
	if total_points > high_score:
		high_score = total_points
	total_points = 0
	get_tree().reload_current_scene.call_deferred()
	
