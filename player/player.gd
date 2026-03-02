class_name Player extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -800.0
const GRAVITY_MULTIPLIER = 2.0
const AIR_MOVE_STRENGTH = 0.5

func apply_gravity(_delta: float) -> void:
	velocity += get_gravity() * _delta * GRAVITY_MULTIPLIER
