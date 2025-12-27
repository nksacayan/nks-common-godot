extends Resource
class_name BaseStat

signal value_changed(new_value: int)

# Stat name unnecessary since leveled stats will be values in a keyed dict
@export var _min_value: int = 1
@export var _max_value: int = 999

const DEFAULT_VALUE: int = 1
var _value: int = DEFAULT_VALUE
@export var value: int = DEFAULT_VALUE:
	set(p_value):
		_value = clamp(p_value, _min_value, _max_value)
		value_changed.emit(_value)

func _init(p_value = 1, p_max_value = 999, p_min_value = 1) -> void:
	_min_value = p_min_value
	_max_value = p_max_value
	value = p_value