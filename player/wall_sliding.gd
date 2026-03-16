extends PlayerState

func enter(previous_state_path: String, payload := {}) -> void:
	print(WALL_SLIDING)
	
func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	player.velocity.y += player.WALL_SLIDE_SPEED * _delta * 5
	player.velocity.y = clamp(player.velocity.y, -20, player.WALL_SLIDE_SPEED)
	
	var wall_normal = player.get_wall_normal()
	
	if not player.is_pushing_into_wall():
		player.move_and_slide()
		finished.emit(FALLING)
		return
	
	if not player.is_on_wall() and not player.is_on_floor():
		player.move_and_slide()
		finished.emit(FALLING)
		return
	
	if player.velocity.y > 0 and player.is_on_floor():
		player.move_and_slide()
		finished.emit(IDLE)
		return
		
	if player.is_jump_buffered:
		player.move_and_slide()
		finished.emit(WALL_JUMPING)
		return
	
	player.move_and_slide()

	if wall_normal.x > 0:
		animator.global_rotation_degrees = 90;
	else:
		animator.global_rotation_degrees = -90

func exit() -> void:
	animator.global_rotation_degrees = 0
