@tool
extends Resource
class_name LeveledStat

signal leveled_up

const MIN_REQUIRED_EXPERIENCE: int = 100
const MIN_EXPERIENCE: int = 0

var required_experience: int:
	get:
		if not stat:
			return MIN_REQUIRED_EXPERIENCE
		return MIN_REQUIRED_EXPERIENCE * stat.value

@export var experience: int = MIN_EXPERIENCE:
	set(p_experience):
		experience = p_experience
		if not stat:
			return
			
		while experience >= required_experience and required_experience > 0:
			experience -= required_experience
			stat.value += 1
			leveled_up.emit()

@export var stat: BaseStat

func _init(p_stat: BaseStat = null) -> void:
	if p_stat == null:
		stat = BaseStat.new()
	else:
		stat = p_stat
