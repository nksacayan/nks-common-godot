extends Resource
class_name LeveledStat

signal leveled_up

# Play with this later for scaling exp requirements
# Pretty sure if my required exp is ever 0 something will break
const MIN_REQUIRED_EXPERIENCE: int = 100
var required_experience: int:
	get:
		return MIN_REQUIRED_EXPERIENCE * stat_value.value
const MIN_EXPERIENCE: int = 0
var _experience: int = MIN_EXPERIENCE
@export var experience: int = MIN_EXPERIENCE:
	set(p_experience):
		while p_experience >= required_experience:
			p_experience -= required_experience
			stat_value.value += 1
			leveled_up.emit()
		_experience = p_experience
	get:
		return _experience

const DEFAULT_STAT_MIN := 1
const DEFAULT_STAT_MAX := 999
@export var stat_value: ClampedInt = ClampedInt.new(DEFAULT_STAT_MIN, DEFAULT_STAT_MAX, DEFAULT_STAT_MIN)

func _init(p_stat_value: int = DEFAULT_STAT_MIN, p_stat_max: int = DEFAULT_STAT_MAX, p_experience: int = MIN_EXPERIENCE, p_stat_min: int = DEFAULT_STAT_MIN) -> void:
	stat_value._min_value = p_stat_min
	stat_value._max_value = p_stat_max
	stat_value.value = p_stat_value
	experience = p_experience