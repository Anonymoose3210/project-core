extends Node

@onready var player: CharacterBody2D = $"../Player"

var x_pos = 1
var y_pos = 250

const RUBY_ODDS = 0.2
const EMERALD_ODDS = RUBY_ODDS + 0.2
const DIAMOND_ODDS = EMERALD_ODDS + 0.2
const GOLD_ODDS = DIAMOND_ODDS + 0.2

const STONES_PER_LAYER = 2
const RESOURCES_PER_LAYER = 3

var rock = preload("res://Scenes/rock.tscn")
var iron = preload("res://Scenes/resources/iron_node.tscn")
var gold = preload("res://Scenes/resources/gold_node.tscn")
var diamond = preload("res://Scenes/resources/diamond_node.tscn")
var emerald = preload("res://Scenes/resources/emerald_node.tscn")
var ruby = preload("res://Scenes/resources/ruby_node.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if y_pos - player.position.y < 400:
		for n in range(RESOURCES_PER_LAYER):
			x_pos = randi_range(1, 20) * 15
			generate_resource(x_pos, y_pos)
		for n in range(STONES_PER_LAYER):
			x_pos = randi_range(1, 20) * 15
			generate_rock(x_pos, y_pos)
		y_pos += 30

func generate_rock(x_position: int, y_position: int):
	var rock_instance = rock.instantiate()
	rock_instance.position = Vector2(x_position, y_position)
	add_child(rock_instance)
	
func generate_resource(x_position: int, y_position: int):
	var resource_instance
	var resource_gen = randf()
	if resource_gen <= RUBY_ODDS:
		resource_instance = ruby.instantiate()
	elif resource_gen <= EMERALD_ODDS:
		resource_instance = emerald.instantiate()
	elif resource_gen <= DIAMOND_ODDS:
		resource_instance = diamond.instantiate()
	elif resource_gen <= GOLD_ODDS:
		resource_instance = gold.instantiate()
	else:
		resource_instance = iron.instantiate()
	resource_instance.position = Vector2(x_position, y_position)
	add_child(resource_instance)
