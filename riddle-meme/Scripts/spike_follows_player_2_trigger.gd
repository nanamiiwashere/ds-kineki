extends Area2D

var isFollows = false

var xPosCache = 0

@export var speed = 10
@export var maxDistance = 200

@onready var spike: Sprite2D = $"../Spike"
@onready var player: CharacterBody2D = $"../../CharacterBody2D"

var totalDistance = 0

var hasFollowed = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(delta)
	
	if (isFollows):
		hasFollowed = true
		if (totalDistance > maxDistance):
			if (spike):
				spike.queue_free()
			
		if (spike):
			spike.global_position.x += speed * delta * 60
			totalDistance += speed * delta * 60
			
		if (player.isDead):
			isFollows = false
			totalDistance = 0
	else:
		
		pass
		#spike.global_position.x = xPosCache


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		isFollows = true
		if (spike):
			xPosCache = spike.global_position.x


func _on_timer_timeout() -> void:
	if (hasFollowed):
		spike.global_position.x = xPosCache
