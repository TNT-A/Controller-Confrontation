extends Node2D

var char_name : String = "P2"

var speed : int = 200
var accept_input : bool = true

func _physics_process(delta: float) -> void:
	move()

func move():
	var dir = get_direction()
	$CharacterBody2D.velocity = dir * speed
	if accept_input:
		$CharacterBody2D.move_and_slide()

@onready var starting_pos = $CharacterBody2D.global_position

func _ready() -> void:
	SignalBus.game_start.connect(set_ready)
	SignalBus.game_reset.connect(reset_base)
	SignalBus.game_stop.connect(reset_base)
	reset_base()

func set_ready():
	accept_input = true
	visible = true

func reset_base():
	global_position = starting_pos
	accept_input = false
	visible = false
func get_direction():
	var input : Vector2 = Vector2()
	if accept_input and Input.is_action_pressed("P2_Move_Up"):
		input.y -=1
	if accept_input and Input.is_action_pressed("P2_Move_Down"):
		input.y +=1
	if accept_input and Input.is_action_pressed("P2_Move_Left"):
		input.x -=1
	if accept_input and Input.is_action_pressed("P2_Move_Right"):
		input.x +=1
	return input

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("point"):
		SignalBus.player_scored.emit(char_name, body.get_parent().score)
		SignalBus.point_picked_up.emit(body.get_parent())
