extends Area2D

@onready var collider: CollisionShape2D = $"../left collider/CollisionShape2D"


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		collider.set_deferred("disabled", false)
