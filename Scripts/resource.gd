extends Node2D

@export var score_value = 100

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		GameController.item_collected(score_value)
		self.queue_free()
