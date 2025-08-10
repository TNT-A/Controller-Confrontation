extends Node

var p1_score : int = 0
var p2_score : int = 0
var p3_score : int = 0

var time

func _ready() -> void:
	SignalBus.player_scored.connect(add_score)
	SignalBus.game_reset.connect(reset_score)

func add_score(player, score):
	if player == "P1":
		p1_score += score
	if player == "P2":
		p2_score += score
	if player == "P3":
		p3_score += score
	SignalBus.score_change.emit()
	print(p1_score, " ", p2_score, " ", p3_score)

func reset_score():
	p1_score = 0
	p2_score = 0
	p3_score = 0
	SignalBus.score_change.emit()
