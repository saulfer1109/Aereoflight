extends CharacterBody2D
@export var bullet_scene: PackedScene
@export var SPEED: float = 300.0
const JUMP_VELOCITY = -400.0

var bullet_path = preload("res://scenes/weapon.tscn")
func _process(delta):
	if Input.is_action_just_pressed("shoot"):  # Tecla configurada en InputMap
		shoot()

func shoot():
	var bullet = bullet_path.instantiate()  # Crear una instancia de la bala
	bullet.dir=$Front.rotation
	bullet.pos = $Front.global_position
	bullet.rota = global_rotation
	$AnimatedSprite2D.play("shooting")
	get_parent().add_child(bullet)
	$AnimatedSprite2D.play("default")
	

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
