extends PlayerState

var time_falling = 0.0

func enter(previous_state_path: String, payload := {}) -> void:
	print(FALLING)
	last_state = previous_state_path
	time_falling = 0.0
	
func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	player.apply_gravity(_delta)
	player.move_in_air(_delta)
	
	if player.velocity.y > 0 and player.is_on_floor():
		player.move_and_slide()
		finished.emit(RUNNING)
		return
		
	if player.is_pushing_into_wall():
		player.move_and_slide()
		finished.emit(WALL_SLIDING)
		return
	
	if last_state == WALL_SLIDING and Input.is_action_just_pressed("jump") and time_falling <= 0.1:
		player.move_and_slide()
		finished.emit(WALL_JUMPING)
		return
		
	if last_state == RUNNING and Input.is_action_just_pressed("jump") and time_falling <= 0.1:
		player.move_and_slide()
		finished.emit(JUMPING)
		return
	
	player.move_and_slide()
	time_falling += _delta

func exit() -> void:
	pass
