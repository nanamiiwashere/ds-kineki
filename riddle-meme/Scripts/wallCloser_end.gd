extends Area2D

@onready var closer: CollisionShape2D = $"../StaticBody2D/closer"


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		closer.set_deferred("disabled", false)
