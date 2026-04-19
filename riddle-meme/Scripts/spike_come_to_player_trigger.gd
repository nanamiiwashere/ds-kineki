extends Area2D

var isRuned = false

@onready var animation_spike_come_to_player: AnimationPlayer = $"../Animation_SpikeComeToPlayer"

@onready var whyDied_text: Label = $"../Why Died?"
@onready var isItHard_text: Label = $"../Is it really that hard?"
@onready var no_Text: Label = $"../NO!!!"
@onready var text_6: Area2D = $"../../Tutorial Text Trigger/text6"

func _ready() -> void:
	no_Text.visible = false


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player") && !isRuned):
		isRuned = true
		animation_spike_come_to_player.current_animation = "Spike Come to Player";
		no_Text.visible = true
		whyDied_text.visible = false
		isItHard_text.visible = false
		text_6.process_mode = Node.PROCESS_MODE_INHERIT
