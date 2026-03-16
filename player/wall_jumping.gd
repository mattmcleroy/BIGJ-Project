extends PlayerState

var timer = 0.0

func enter(previous_state_path: String, payload := {}) -> void:
	print(WALL_JUMPING)

	var x = player.get_wall_normal().x / abs(player.get_wall_normal().x) * player.WALL_JUMP_HORIZONTAL_VELOCITY
	var y = player.WALL_JUMP_VERTICAL_VELOCITY
	
	if player.x_input * player.get_wall_normal().x > 0:
		x *= 1.5
		y *= 1.2
		print("true")
	elif player.is_pushing_into_wall():
		x *= 0.7
		y *= 1.4
		
	player.velocity.x = x
	player.velocity.y = y
	
func update(_delta: float) -> void:
	
	if player.velocity.x > 0:
		animator.play("walk_right")
	elif player.velocity.x < 0:
		animator.play("walk_left")

func physics_update(_delta: float) -> void:
	player.apply_gravity(_delta)
	player.move_in_air(_delta)
	
	if (player.velocity.y > 0):
		finished.emit(FALLING)
		timer = 0
		return
		
	player.move_and_slide()

func exit() -> void:
	pass
