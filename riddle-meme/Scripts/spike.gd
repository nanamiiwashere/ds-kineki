extends Area2D

@export var spawnpoint: Node2D

var attemps = 2
var currentAttemps = 0

var a = false

@onready var whyDied_text: Label = $"../../Why Died?"
@onready var player: CharacterBody2D = $"../../../CharacterBody2D"
@onready var timer: Timer = $"../../../Node/Timer"
@onready var spike_follow_player_trigger: Area2D = $"../../SpikeFollowPlayer_trigger"
@onready var isItHard_text: Label = $"../../Is it really that hard?"
@onready var spike_come_to_player_trigger: Area2D = $"../../SpikeComeToPlayer_trigger"
@onready var spike_follow_player_2_trigger: Area2D = $"../../SpikeFollowPlayer2_trigger"


@onready var text_4: Area2D = $"../../../Tutorial Text Trigger/text4"
@onready var text_5: Area2D = $"../../../Tutorial Text Trigger/text5"
@onready var text_6: Area2D = $"../../../Tutorial Text Trigger/text6"
@onready var no_Text: Label = $"../../NO!!!"
@onready var sorryForgot_text: Label = $"../../Sorry, i forgot"

var oneDiesCounter = 0

func _ready() -> void:
	whyDied_text.visible = false
	isItHard_text.visible = false
	sorryForgot_text.visible = false

func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		player.playerDied();
		timer.start()
		
		if (!a):
			whyDied_text.visible = true
			a = true
		
		currentAttemps += 1
		
		if (currentAttemps == attemps):
			isItHard_text.visible = true
			
		if (spike_come_to_player_trigger.isRuned):
			if (oneDiesCounter == 1):
				text_4.visible = false
				text_5.visible = false
				text_6.visible = false
				no_Text.visible = false
				sorryForgot_text.visible = true
				spike_follow_player_2_trigger.process_mode = Node.PROCESS_MODE_INHERIT
			
			oneDiesCounter += 1;


func _on_timer_timeout() -> void:
	player.respawn(spawnpoint.global_position)
	if (spike_follow_player_trigger):
		spike_follow_player_trigger.isFollows = false
		
		if (currentAttemps == attemps):
			spike_follow_player_trigger.finishAttemps = true
