extends Node2D

var states

func get_state(state_name):
	states = {
		"Idle": $IdleState, "Attack": $AttackState
}
