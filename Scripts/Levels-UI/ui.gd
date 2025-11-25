extends CanvasLayer

@onready var score: Label = $Panel/Score
@onready var money: Label = $Panel/money
@onready var wave_count: Label = $Panel/wave_count
@onready var enemies_left: Label = $"Panel/Enemies left"


func _process(_delta: float) -> void:
	score.text = str("Score: ", GameManager.Score)
	money.text = str("Mons: ", GameManager.Money)
	wave_count.text = str("Enemies Left: ", get_parent().enemies_to_spawn) 
	enemies_left.text = str("Enemies Left to kill: ", get_parent().enemies_to_die) 
	## change the get_parent()^ later to to be more dynamic with the levels
