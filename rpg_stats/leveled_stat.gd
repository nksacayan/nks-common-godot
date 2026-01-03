@tool
extends Resource
class_name LeveledStat

signal leveled_up

const MIN_REQUIRED_EXPERIENCE: int = 100
const MIN_EXPERIENCE: int = 0
const DEFAULT_STAT_MIN := 1
const DEFAULT_STAT_MAX := 999
const DEFAULT_STAT_NAME: String = "DEFAULT STAT NAME"

@export var _stat_name: String = DEFAULT_STAT_NAME
var stat_name: String = DEFAULT_STAT_NAME:
	get:
		return _stat_name

var required_experience: int:
	get:
		if not stat_value: 
			return MIN_REQUIRED_EXPERIENCE
		return MIN_REQUIRED_EXPERIENCE * stat_value.value

var _experience: int = MIN_EXPERIENCE
@export var experience: int = MIN_EXPERIENCE:
	set(p_experience):
		_experience = p_experience
		if not stat_value:
			return
			
		while _experience >= required_experience and required_experience > 0:
			_experience -= required_experience
			stat_value.value += 1
			leveled_up.emit()
	get:
		return _experience

@export var stat_value: ClampedInt

func _init(p_stat_name: String = DEFAULT_STAT_NAME, p_stat_value: int = DEFAULT_STAT_MIN, p_stat_max: int = DEFAULT_STAT_MAX, p_experience: int = MIN_EXPERIENCE, p_stat_min: int = DEFAULT_STAT_MIN) -> void:
	# Only initialize if it doesn't already exist (from a save/load)
	_stat_name = p_stat_name
	if not stat_value:
		stat_value = ClampedInt.new(p_stat_value, p_stat_max, p_stat_min)
	# stat value must be initialized before using experience setter
	experience = p_experience
