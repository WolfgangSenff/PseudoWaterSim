extends KinematicBody2D

var captured_body = null

func _on_FloatingPlatform_body_entered(body: PhysicsBody2D) -> void:
    if captured_body == null:
        captured_body = body
        
