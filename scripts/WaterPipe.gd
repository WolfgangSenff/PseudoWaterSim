extends Node2D

signal begun_emitting
signal begin_splash
signal end_emitting

onready var main_emitter = $MainEmitter
onready var bottom_splash_emitter = $BottomSplashContainer/BottomSplashEmitter
onready var anim_player = $AnimationPlayer

export (float) var TopCollisionTime

func _ready() -> void:
    main_emitter.emitting = false
    bottom_splash_emitter.emitting = false

func begin_pouring() -> void:
    emit_signal("begun_emitting")
    main_emitter.emitting = true
    yield(get_tree().create_timer(TopCollisionTime), "timeout")
    emit_signal("begin_splash")
    anim_player.play("Default")
    yield(anim_player, "animation_finished")
    emit_signal("end_emitting")