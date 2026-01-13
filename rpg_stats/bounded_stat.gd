extends Resource
class_name BoundedStat

signal value_changed(p_new_value: int)
signal value_minimum_reached(p_new_value: int)

const MIN_VALUE := 0

var max_stat: BaseStat
var current_value: int:
	set(p_value):
		current_value = clamp(p_value, MIN_VALUE, max_stat.value)
		value_changed.emit(current_value)
		if current_value == MIN_VALUE:
			value_minimum_reached.emit(current_value)

func _init(p_max_stat: BaseStat):
	max_stat = p_max_stat
	current_value = max_stat.value