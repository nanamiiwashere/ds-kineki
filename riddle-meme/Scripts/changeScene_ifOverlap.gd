extends Area2D

@onready var player: CharacterBody2D = $"../../CharacterBody2D"

func _process(delta: float) -> void:
	if (overlaps_body(player)):
		get_tree().reload_current_scene()
