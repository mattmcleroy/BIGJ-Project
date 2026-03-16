class_name Player extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
const AIR_SPEED = 300.0
const AIR_ACCELERATION = 3.0
const WALL_JUMP_VERTICAL_VELOCITY = -600.0
const WALL_JUMP_HORIZONTAL_VELOCITY = 300.0
const GRAVITY_MULTIPLIER = 3.0
const AIR_MOVE_STRENGTH = 0.5
const WALL_SLIDE_SPEED = 250.0
const JUMP_BUFFER_TIME = 100

var time_jump_last_pressed: float
var is_jump_buffered := false
var is_jump_buffered_and_held := false
var x_input := 0.0

@export var player_animator: PlayerAnimator

func _process(delta):
	_update_input()
		
		
func _update_input() -> void:
	if Input.is_action_just_pressed("jump"):
		time_jump_last_pressed = Time.get_ticks_msec()
		
	if Time.get_ticks_msec() - time_jump_last_pressed <= JUMP_BUFFER_TIME:
		is_jump_buffered = true
	else:
		is_jump_buffered = false
	
	if is_jump_buffered and Input.is_action_pressed("jump"):
		is_jump_buffered_and_held = true
	
	x_input = Input.get_axis("move_left", "move_right")


func apply_gravity(_delta: float) -> void:
	velocity += get_gravity() * _delta * GRAVITY_MULTIPLIER
	velocity.y = clamp(velocity.y, -1000000, 800)
	print(velocity.y)
	
	
func is_pushing_into_wall() -> bool:
	if not is_on_wall():
		return false
		
	if (x_input * get_wall_normal().x < 0):
		return true
	else:
		return false
		
		
func is_pushing_off_wall() -> bool:
	if not is_on_wall():
		return false
		
	if (x_input * get_wall_normal().x > 0):
		return true
	else:
		return false


func move_in_air(_delta) -> void:
	var target_speed = x_input * AIR_SPEED
	if x_input == 0 or velocity.x * target_speed > target_speed * target_speed:
		velocity.x -= velocity.x * _delta * 0.25
		return
	var error = AIR_SPEED * x_input - velocity.x
	velocity.x += error * AIR_ACCELERATION * _delta
