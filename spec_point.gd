extends Node2D

@onready var point_scene : PackedScene = preload("res://points/base_point.tscn")
@onready var spec_scene : PackedScene = preload("res://points/spec_point.tscn")

@export var score : int = 3

func _ready() -> void:
	SignalBus.point_picked_up.connect(destroy)
	point_scene = load("res://points/base_point.tscn")
	spec_scene = load("res://points/spec_point.tscn")

func destroy(body):
	if self == body:
		spawn_new()
		queue_free()

func spawn_new():
	var rand_num : int = randi_range(1,5)
	var rand_position : Vector2 = Vector2(randf_range(100,1052), randi_range(50,598))
	if rand_num < 5:
		print("reg")
		var new_point = point_scene.instantiate()
		var layer = get_parent()
		new_point.global_position = rand_position
		layer.add_child(new_point)
	else:
		print("spec")
		var new_point = spec_scene.instantiate()
		var layer = get_parent()
		new_point.global_position = rand_position
		layer.add_child(new_point)
