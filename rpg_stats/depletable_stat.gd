class_name DepletableStat extends RefCounted

signal changed(new_value: int)
signal increased(amount: int)
signal decreased(amount: int)
signal depleted
signal replenished

var _stat_name: String
var stat_name: String:
	get:
		return _stat_name

var max_value: int
var min_value: int

var _current: int
var current: int:
	get:
		return _current
	set(value):
		var clamped_value = clampi(value, min_value, max_value)
		
		# If the value didn't actually change (e.g., healing at full health), exit early
		if clamped_value == _current:
			return

		var previous = _current
		_current = clamped_value

		# Emit signals based on the change
		changed.emit(_current)

		if _current > previous:
			increased.emit(_current - previous)
		else:
			decreased.emit(previous - _current)

		# State-specific signals
		if _current <= min_value:
			depleted.emit()
		elif _current >= max_value:
			replenished.emit()

func _init(p_stat_name: String, p_max: int = 100, p_min: int = 0, p_initial: int = -1) -> void:
	_stat_name = p_stat_name
	max_value = p_max
	min_value = p_min
	# Default to max if no specific starting value is provided
	_current = p_initial if p_initial != -1 else max_value