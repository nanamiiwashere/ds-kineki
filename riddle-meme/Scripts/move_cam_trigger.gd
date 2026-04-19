extends Camera2D


@export var isOn = false

@export var spaceOffset = 0
#@onready var camera: Camera2D = $".."

var screen_width = 1152
var screen_height = 648

@onready var player: CharacterBody2D = $"../../WORLD/CharacterBody2D"

func _ready() -> void:
	screen_width -= spaceOffset
	screen_height -= spaceOffset

func _physics_process(delta: float) -> void:
	if not isOn:
		return
	
	moveCamera()
	
	print(global_position)
		
	#if overlaps_body(player):
		#if is_in_group("left_moveCamTrigger"):
			#moveCamera("left")
		#elif is_in_group("right_moveCamTrigger"):
			#moveCamera("right")



#func moveCamera(direction: String) -> void:
	#if direction == "left":
		#camera.position.x -= (1152 - spaceOffset)
	#elif direction == "right":
		#camera.position.x += (1152 - spaceOffset)
		
		
func moveCamera() -> void:
	var target_x = floor(player.global_position.x / screen_width) * screen_width + (screen_width / 2.0)
	var target_y = floor(player.global_position.y / screen_height) * screen_height + (screen_height / 2.0)
	global_position.x = target_x
	global_position.y = target_y
