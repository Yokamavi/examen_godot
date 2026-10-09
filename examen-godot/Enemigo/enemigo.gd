extends CharacterBody2D

const SPEED = -100.0
@export var raycast: RayCast2D
@export var area_danho: Area2D
@export var area_muerte: Area2D
func _ready() -> void:
	area_danho.body_entered.connect(_on_danho_body_entered)
	area_muerte.body_entered.connect(_on_muerte_body_entered)
func _physics_process(delta: float) -> void:
	#Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta
	if !raycast.is_colliding():
		velocity.x = SPEED
	else:
		velocity.x = SPEED * 2
	move_and_slide()
func _on_danho_body_entered(_body: Node2D) -> void:
	get_tree().quit()
func _on_muerte_body_entered(_body: Node2D) -> void:
	queue_free()
