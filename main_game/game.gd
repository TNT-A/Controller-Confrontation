extends Node2D

func _ready() -> void:
	SignalBus.score_change.emit()
