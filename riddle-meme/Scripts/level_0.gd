extends Node

@onready var intro_screen: AnimationPlayer = $"../Node/AnimationPlayer"
@onready var player: CharacterBody2D = $"../WORLD/CharacterBody2D"
@onready var player_respawn_point: Node2D = $"../WORLD/Troll Spikes/Player RespawnPoint"
@onready var camMove_trigger: Camera2D = $"../Camera2D"
@onready var player_respawn_point_2: Node2D = $"../WORLD/Player RespawnPoint2"
@onready var player_respawn_point_3: Node2D = $"../WORLD/END/Player RespawnPoint3"

var currentPhase = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("skip_phase")):
		currentPhase += 1
		doThings(currentPhase)
	elif (Input.is_action_just_pressed("revert_phase")):
		currentPhase -= 1
		doThings(currentPhase)
		
func doThings(idx: int) -> void:
	if (idx == 1):
		intro_screen.current_animation = "RESET"
		camMove_trigger.isOn = true
	elif (idx == 2):
		player.global_position = player_respawn_point.global_position
	elif (idx == 3):
		player.global_position = player_respawn_point_2.global_position
	elif (idx == 4):
		player.global_position = player_respawn_point_3.global_position
		
