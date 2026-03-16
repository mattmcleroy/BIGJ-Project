extends PlayerState


func enter(previous_state_path: String, payload := {}) -> void:
	print(RUNNING)
	# set animation to running
	
func update(_delta: float) -> void:
	if player.is_jump_buffered:
		finished.emit(JUMPING)

func physics_update(_delta: float) -> void:
	player.velocity.x = player.x_input * player.SPEED
	
	if player.x_input < 0:
		animator.play("walk_left")
	else: if player.x_input > 0:
		animator.play("walk_right")
	else:
		finished.emit(IDLE)
	
	if !player.is_on_floor():
		finished.emit(FALLING)
	
	player.apply_gravity(_delta)
	player.move_and_slide()

func exit() -> void:
	pass
