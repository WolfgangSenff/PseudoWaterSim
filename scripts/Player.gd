extends KinematicBody2D

export (float) var BaseSpeed
export (float) var Acceleration
export (float) var Gravity
export (float) var JumpForce
export (float) var CameraSpeed

onready var camera_tween = $CameraTween
onready var camera = $Camera2D

var motion = Vector2()
var can_move = true
var current_camera_global_position = Vector2()

func _physics_process(delta : float) -> void:
    if !can_move:
        return
        
    motion = Vector2(0, motion.y)
    var direction = Vector2()
    if Input.is_action_pressed("ui_left"):
        direction += Vector2.LEFT * BaseSpeed
    if Input.is_action_pressed("ui_right"):
        direction += Vector2.RIGHT * BaseSpeed
    if Input.is_action_just_pressed("ui_jump"):
        if is_on_floor():
            direction += Vector2.UP * JumpForce
        
    motion += direction
    motion += Vector2(0, Gravity)
    motion = move_and_slide(motion, Vector2.UP)
    
func move_camera_to(pos : Vector2) -> void:
    can_move = false
    current_camera_global_position = camera.global_position
    camera_tween.interpolate_property(camera, "global_position", current_camera_global_position, pos, 1.0 / CameraSpeed, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
    camera_tween.start()
    yield(camera_tween, "tween_all_completed")
    print("Crap")

func move_camera_back() -> void:
    camera_tween.interpolate_property(camera, "global_position", camera.global_position, current_camera_global_position, 1.0 / CameraSpeed, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
    camera_tween.start()
    yield(camera_tween, "tween_all_completed")
    can_move = true