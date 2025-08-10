extends Control

func _ready() -> void:
	SignalBus.game_stop.connect(present_winner)
	SignalBus.game_reset.connect(reset)
	visible = false

func present_winner():
	visible = true
	if ScoreManager.p1_score >= ScoreManager.p2_score and ScoreManager.p1_score >= ScoreManager.p3_score:
		$CenterContainer/VBoxContainer/Label.text = "KEYBOARD WINS!"
	if ScoreManager.p2_score >= ScoreManager.p1_score and ScoreManager.p2_score >= ScoreManager.p3_score:
		$CenterContainer/VBoxContainer/Label.text = "CONTROLLER WINS!"
	if ScoreManager.p3_score >= ScoreManager.p2_score and ScoreManager.p3_score >= ScoreManager.p1_score:
		$CenterContainer/VBoxContainer/Label.text = "MOUSE WINS!"

func reset():
	visible = false

func _on_button_pressed() -> void:
	SignalBus.game_reset.emit()
