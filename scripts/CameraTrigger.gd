extends Area2D

export (NodePath) onready var PlayerPath
onready var player = get_node(PlayerPath)

export (NodePath) onready var NewCameraPositionPath
onready var new_camera_position = get_node(NewCameraPositionPath)

func _on_CameraTrigger_body_entered(body: PhysicsBody2D) -> void:
    body.move_camera_to(new_camera_position.global_position)