extends Control

@onready var P1_base_string = $HBoxContainer/Label.text
@onready var P2_base_string = $HBoxContainer/Label2.text
@onready var P3_base_string = $HBoxContainer/Label3.text

@onready var base_timer = $Label.text

func _ready() -> void:
	SignalBus.score_change.connect(update_score)

func update_score():
	$HBoxContainer/Label.text = P1_base_string + str(ScoreManager.p1_score)
	$HBoxContainer/Label2.text = P2_base_string + str(ScoreManager.p2_score)
	$HBoxContainer/Label3.text = P3_base_string + str(ScoreManager.p3_score)

func _physics_process(delta: float) -> void:
	$Label.text = base_timer + str(int(ScoreManager.time))
