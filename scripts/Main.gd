extends Node2D

onready var water_pipe = $WaterPipe
onready var player = $Player

func _on_WaterPipe_end_emitting() -> void:
    player.move_camera_back()

func _on_CameraTrigger_body_entered(body: PhysicsBody2D) -> void:
    water_pipe.begin_pouring()
