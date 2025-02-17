extends CharacterBody2D

var speed: float=100.0
var direction: Vector2=Vector2.ZERO
var change_direction_timer: float = 2.0
var current_timer: float = 0.0

@export var ui: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	direction=get_random_direction()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Mueve al enemigo en la dirección actual
	position += direction * speed * delta
	# Limita la posición del enemigo a los bordes de la pantalla
	position.x = clamp(position.x, -150, 150)
	position.y = clamp(position.y, -225, 225)

	# Actualiza el temporizador
	current_timer += delta

	# Cambia la dirección cuando el temporizador alcanza el límite
	if current_timer >= change_direction_timer:
		direction = get_random_direction()  # Nueva dirección aleatoria
		current_timer = 0.0  # Reinicia el temporizador
	if Global.score >= 20:
		get_tree().change_scene_to_file("res://scenes/win.tscn")
	
func get_random_direction() -> Vector2:
	# Genera un ángulo aleatorio en radianes
	var angle = randf() * 2 * PI
	# Convierte el ángulo en un vector de dirección normalizado
	return Vector2(cos(angle), sin(angle)).normalized()

func _exit_tree() -> void:
	pass
