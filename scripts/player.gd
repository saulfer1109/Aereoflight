extends CharacterBody2D
@export var bullet_scene: PackedScene
@export var SPEED: float = 300.0
const JUMP_VELOCITY = -400.0
var shoot_timer = 0.20
var current_time = 0

var bullet_path = preload("res://scenes/bullet.tscn")
func _process(delta):
	if Input.is_action_pressed("shoot") and current_time > shoot_timer:
		shoot()
		current_time = 0
	current_time += delta
	
func shoot():
	var bullet = bullet_path.instantiate()  # Crear una instancia de la bala
	bullet.dir=$Front.rotation
	bullet.pos = $Front.global_position
	bullet.rota = global_rotation
	$"Laser-shot".play()
	get_parent().add_child(bullet)
	

func _physics_process(delta: float) -> void:
	var directionVertical := Input.get_axis("up","down")
	var directionHorizontal := Input.get_axis("left", "right")
	if directionHorizontal or directionVertical:
		velocity.y = directionVertical * SPEED
		velocity.x = directionHorizontal * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	move_and_slide()
