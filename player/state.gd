class_name State extends Node

var last_state: String

signal finished(next_state: String)

func enter(previous_state_path: String, payload := {}) -> void:
	pass
	
func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func exit() -> void:
	pass
