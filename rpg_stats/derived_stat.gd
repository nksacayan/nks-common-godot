extends RefCounted
class_name DerivedStat

var base_stats: Array[BaseStat]
var calculate_stat_value: Callable # -> int
# readonly plz
var stat: BaseStat

func _init(p_base_stats: Array[BaseStat], p_calculate_stat_value: Callable, p_stat_name: String = BaseStat.DEFAULT_STAT_NAME) -> void:
	base_stats = p_base_stats
	calculate_stat_value = p_calculate_stat_value
	stat = BaseStat.new(calculate_stat_value.call(base_stats), p_stat_name)
	# refresh calculated value if base stats ever change
	for base_stat in base_stats:
		base_stat.value_changed.connect(
			func() -> void: stat.value = calculate_stat_value.call(base_stats)
		)
