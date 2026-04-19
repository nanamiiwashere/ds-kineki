extends Area2D


var hasHit = false

var attempts = 0

@onready var timer_died: Timer = $"../Timer waiting to died"
@onready var timer_respawn: Timer = $"../Timer waiting to respawn"
@onready var player: CharacterBody2D = $"../../CharacterBody2D"
@onready var spawnpoint: Node2D = $"../Player RespawnPoint3"


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player") && !hasHit):
		hasHit = true
		timer_died.start()
		

func _on_timer_timeout_toDead() -> void:
	player.playerDied()
	attempts += 1
	timer_respawn.start()

func _on_timer_timeout_toRespawn() -> void:
	player.respawn(spawnpoint.global_position)
	hasHit = false
