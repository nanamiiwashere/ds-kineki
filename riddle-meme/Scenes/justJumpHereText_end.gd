extends Label

@onready var pitKill_trigger: Area2D = $"../pitKill_trigger"
@onready var wall_collider: CollisionShape2D = $"../StaticBody2D/WALL COLLIDER"

@export var maxAttempts = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (pitKill_trigger.attempts == maxAttempts):
		visible = true
