@tool
extends Resource
class_name ClampedInt

signal value_changed(new_value: int)

const DEFAULT_MIN_VALUE: int = 0
@export var _min_value: int = DEFAULT_MIN_VALUE
var min_value: int = DEFAULT_MIN_VALUE:
	get:
		return _min_value

const DEFAULT_MAX_VALUE := 999
@export var _max_value: int = DEFAULT_MAX_VALUE
var max_value: int = DEFAULT_MAX_VALUE:
	get:
		return _max_value

var _value: int = DEFAULT_MIN_VALUE
@export var value: int = DEFAULT_MIN_VALUE:
	set(p_value):
		_value = clamp(p_value, _min_value, _max_value)
		value_changed.emit(_value)
	get:
		return _value

func _init(p_max_value = DEFAULT_MAX_VALUE, p_value = DEFAULT_MIN_VALUE, p_min_value = DEFAULT_MIN_VALUE) -> void:
	_min_value = p_min_value
	_max_value = p_max_value
	value = p_value