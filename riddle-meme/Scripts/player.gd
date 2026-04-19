extends CharacterBody2D

@export var isOn = false

var isDead = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_died_particle: GPUParticles2D = $"../Node/Player Died Particle"



func _physics_process(delta: float) -> void:
	if (isOn):
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("walk_left", "walk_right")
		if direction:
			velocity.x = direction * SPEED
			anim.animation = "walk"
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			anim.animation = "idle"

		move_and_slide()


func playerDied() -> void:
	isDead = true
	isOn = false
	modulate = Color(1, 1, 1, 0)
	player_died_particle.global_position = global_position
	player_died_particle.emitting = true
	

# respawn
func respawn(spawnpoint: Vector2) -> void:
	isDead = false
	isOn = true
	modulate = Color(1, 1, 1, 1)
	global_position = spawnpoint
