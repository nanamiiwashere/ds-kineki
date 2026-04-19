extends Area2D

@onready var sybau_convo: AnimationPlayer = $"../sybau_convo"

var isStarted = false


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player") && !isStarted):
		isStarted = true
		sybau_convo.current_animation = "sybau_convo"
