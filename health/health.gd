class_name Health extends Node

signal health_changed(value: int)
signal health_increased
signal health_decreased
signal health_depleted
@export var max_health: int = 1
@export var min_health: int = 0

var _health: int
var current_health: int:
	get:
		return _health
	set(value):
		if value != _health:
			health_changed.emit(value)
		if value > _health:
			health_increased.emit()
		elif value < _health:
			health_decreased.emit()
		_health = clampi(value, min_health, max_health)
		if _health == min_health:
			health_depleted.emit()

func _enter_tree() -> void:
	_health = max_health
