extends Resource
class_name BaseStat

signal stat_level_up(amount: int)

enum StatNames {
	STRENGTH,
	DEXTERITY,
	CONSTITUTION,
	WILLPOWER,
	INTELLIGENCE,
	PERCEPTION,
}

const MIN_STAT: int = 1
const MAX_STAT: int = 9999

const MIN_EXP: int = 0
const MAX_EXP: int = 9999
const EXP_FACTOR: int = 10

@export var stat_name: StatNames

var _stat_value: int = MIN_STAT
@export var stat_value: int:
	get:
		return _stat_value
	set(value):
		_stat_value = clamp(value, MIN_STAT, MAX_STAT)

var required_exp:
	get:
		return min(_stat_value * EXP_FACTOR, MAX_EXP)

var _stat_exp: int = MIN_EXP
var stat_exp: int:
	get:
		return _stat_exp
	set(value):
		if (value >= required_exp):
			@warning_ignore("integer_division")
			var num_levels: int = value / required_exp
			stat_value += num_levels
			value %= required_exp
			stat_level_up.emit(num_levels)
		_stat_exp = clamp(value, MIN_EXP, MAX_EXP)

func _init(p_stat_name: StatNames = StatNames.STRENGTH) -> void:
	stat_name = p_stat_name