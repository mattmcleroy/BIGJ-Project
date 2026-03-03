extends PlayerState


func enter() -> void:
	print(RUNNING)
	# set animation to running
	
func update(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)

func physics_update(_delta: float) -> void:
	var x_input = Input.get_axis("move_left", "move_right")
	player.velocity.x = x_input * player.SPEED
	
	if x_input < 0:
		animator.play("walk_left")
	else: if x_input > 0:
		animator.play("walk_right")
	else:
		finished.emit(IDLE)
	
	if !player.is_on_floor():
		finished.emit(FALLING)
	
	player.apply_gravity(_delta)
	player.move_and_slide()

func exit() -> void:
	pass
