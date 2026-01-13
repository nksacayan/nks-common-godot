@tool
extends Resource
class_name BaseStat

signal value_changed(p_new_value: int)

const DEFAULT_STAT_NAME := "DEFAULT STAT NAME"
const DEFAULT_VALUE := 0

@export var _stat_name: String = DEFAULT_STAT_NAME
var stat_name: String = DEFAULT_STAT_NAME:
	get:
		return _stat_name

@export var value: int = DEFAULT_VALUE:
	set(p_value):
		value = p_value
		value_changed.emit(value)

func _init(p_stat_name: String = DEFAULT_STAT_NAME, p_value: int = DEFAULT_VALUE) -> void:
	_stat_name = p_stat_name
	value = p_value