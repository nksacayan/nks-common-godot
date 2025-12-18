extends Resource
class_name CharacterStatExp

@export var managed_stat: CharacterStat

# "Level" will be the managed stat's value
var _max_exp: int = 100
@export var current_exp: int = 0:
	set(value):
		if value > _max_exp:
			# TODO: Exp scaling logic so that every level doesn't cost the same exp
			# TODO: Handle having more exp than a single level up
			_level_stat()
			value -= _max_exp
		current_exp = value


func _level_stat() -> void:
	managed_stat.value += 1

func _init(p_managed_stat: CharacterStat = CharacterStat.new()) -> void:
	managed_stat = p_managed_stat