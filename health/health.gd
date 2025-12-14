class_name Health extends RefCounted

signal health_changed(value: int)
signal health_increased
signal health_decreased
signal health_depleted
var max_health: int
var min_health: int

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
		if _health <= min_health:
			health_depleted.emit()

func _init(p_max_health: int = 100, p_min_health: int = 0) -> void:
	max_health = p_max_health
	min_health = p_min_health
	_health = max_health
