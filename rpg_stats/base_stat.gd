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
	set = set_value,
	get = get_value

# allows subclasses to override
func set_value(p_value: int) -> void:
	value = p_value
	value_changed.emit(value)

func get_value() -> int:
	return value

func _init(p_value: int = DEFAULT_VALUE, p_stat_name: String = DEFAULT_STAT_NAME) -> void:
	value = p_value
	_stat_name = p_stat_name