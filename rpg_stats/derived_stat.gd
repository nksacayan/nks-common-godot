# get rid of tool because i don't want this used in editor
@warning_ignore("MISSING_TOOL")
extends BaseStat
class_name DerivedStat
# don't persist this value either, recalc it on startup

var base_stats: Array[BaseStat]
var calculate_stat_value: Callable # (Array[BaseStat]) -> int

func set_value(_p_value: int) -> void:
	push_error("Derived stat value read. These are meant to be read only")

func _init(
	p_base_stats: Array[BaseStat],
	p_calculate_stat_value: Callable,
	p_stat_name: String = DEFAULT_STAT_NAME
	) -> void:
	# editor creation guard
	if not resource_path.is_empty():
		push_error("DerivedStat is logic-only and cannot be a saved Resource. Use code to instantiate.")
		return
	base_stats = p_base_stats
	calculate_stat_value = p_calculate_stat_value
	super (p_stat_name, calculate_stat_value.call(base_stats))
	for base_stat in base_stats:
		base_stat.value_changed.connect(_set_calculated_value.unbind(1))

func _set_calculated_value() -> void:
	super.set_value(calculate_stat_value.call(base_stats))