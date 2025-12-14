class_name Health extends RefCounted

signal health_changed(value: int)
signal health_increased
signal health_decreased
signal health_depleted
var max_health: int
var min_health: int

var _current_health: int
var current_health: int:
	get:
		return _current_health
	set(value):
		if value != _current_health:
			health_changed.emit(value)

		if value > _current_health:
			health_increased.emit()
		elif value < _current_health:
			health_decreased.emit()
		_current_health = clampi(value, min_health, max_health)
		if _current_health <= min_health:
			health_depleted.emit()

func _init(p_max_health: int = 100, p_min_health: int = 0) -> void:
	max_health = p_max_health
	min_health = p_min_health
	_current_health = max_health
