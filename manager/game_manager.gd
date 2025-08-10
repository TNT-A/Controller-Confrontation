extends Node2D

func _ready() -> void:
	SignalBus.game_start.connect(start)

func start():
	$Timer.start()

func _on_timer_timeout() -> void:
	print("GAMING IS OVER")
	SignalBus.game_stop.emit()

func _physics_process(delta: float) -> void:
	ScoreManager.time = $Timer.time_left
