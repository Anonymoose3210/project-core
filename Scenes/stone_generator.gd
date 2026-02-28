extends Node

@onready var player: CharacterBody2D = $"../Player"

var x_pos = 1
var y_pos = 250

var rock = preload("res://Scenes/rock.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if y_pos - player.position.y < 400:
		for n in range(2):
			x_pos = randi_range(1, 20) * 15
			generate_rock(x_pos, y_pos)
		y_pos += 30
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if y_pos - player.position.y < 400:
		for n in range(2):
			x_pos = randi_range(1, 20) * 15
			generate_rock(x_pos, y_pos)
		y_pos += 30

func generate_rock(x_position: int, y_position: int):
	var rock_instance = rock.instantiate()
	rock_instance.position = Vector2(x_position, y_position)
	add_child(rock_instance)
	
