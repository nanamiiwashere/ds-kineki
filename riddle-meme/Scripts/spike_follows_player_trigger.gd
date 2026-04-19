extends Area2D

var isFollows = false
var finishAttemps = false

var yPosCache = 0

@export var yPosOffset = 0

@onready var player: CharacterBody2D = $"../../CharacterBody2D"
@onready var spike: Sprite2D = $"../Spike"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	yPosCache = spike.global_position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (isFollows):
		spike.global_position.y = player.global_position.y + yPosOffset
	else:
		spike.global_position.y = yPosCache
		
	if (finishAttemps):
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		isFollows = true
		
