@tool
extends Resource
class_name ClampedInt

signal value_changed(p_new_value: int)
signal value_maximum_reached(p_max_value: int)
signal value_minimum_reached(p_min_value: int)

const DEFAULT_MIN_VALUE := 0
@export var min_value: int = DEFAULT_MIN_VALUE

const DEFAULT_MAX_VALUE := 999
@export var max_value: int = DEFAULT_MAX_VALUE

@export var value: int = DEFAULT_MIN_VALUE:
	set(p_value):
		value = clamp(p_value, min_value, max_value)
		
		value_changed.emit(value)
		if value == min_value:
			value_minimum_reached.emit(value)
		if value == max_value:
			value_maximum_reached.emit(value)

func _init(p_max_value = DEFAULT_MAX_VALUE, p_value = DEFAULT_MIN_VALUE, p_min_value = DEFAULT_MIN_VALUE) -> void:
	min_value = p_min_value
	max_value = p_max_value
	value = p_value