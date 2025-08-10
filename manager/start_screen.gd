extends Node2D

var game_started : bool = false

func _on_button_pressed() -> void:
	SignalBus.game_reset.connect(end_game)
	SignalBus.game_start.emit()
	game_started = true

func _physics_process(delta: float) -> void:
	if game_started:
		visible = false
	else:
		visible = true

func end_game():
	game_started = false
