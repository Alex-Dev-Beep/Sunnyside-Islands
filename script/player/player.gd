extends CharacterBody2D

const SPEED = 100.0

@onready var body: AnimatedSprite2D = $body
@onready var hair: AnimatedSprite2D = $hair
@onready var tool: AnimatedSprite2D = $tool

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if velocity.x < -0.001:
		body.flip_h = true
		hair.flip_h = true
		tool.flip_h = true
	elif velocity.x > 0.001:
		body.flip_h = false
		hair.flip_h = false
		tool.flip_h = false
	
	if direction:
		velocity = direction * SPEED
		
		play_animation("walk")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
		play_animation("idle")
		

	move_and_slide()

func play_animation(animation):
	body.play(animation)
	hair.play(animation)
	tool.play(animation)
