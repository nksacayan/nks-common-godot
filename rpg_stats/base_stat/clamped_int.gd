extends Resource
class_name ClampedInt

signal value_changed(new_value: int)

const DEFAULT_MIN_VALUE: int = 1
@export var _min_value: int = DEFAULT_MIN_VALUE
const DEFAULT_MAX_VALUE := 999
@export var _max_value: int = DEFAULT_MAX_VALUE

var _value: int = DEFAULT_MIN_VALUE
@export var value: int = DEFAULT_MIN_VALUE:
	set(p_value):
		_value = clamp(p_value, _min_value, _max_value)
		value_changed.emit(_value)
	get:
		return _value

func _init(p_value = DEFAULT_MIN_VALUE, p_max_value = DEFAULT_MAX_VALUE, p_min_value = DEFAULT_MIN_VALUE) -> void:
	_min_value = p_min_value
	_max_value = p_max_value
	value = p_value