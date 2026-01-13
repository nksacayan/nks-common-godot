# derives from resource but i plan to use it like a ref counted
@warning_ignore("missing_tool")
extends BaseStatResource
class_name DerivedStat

# Could be multiple stats that lead to this product
var source_stats: Array[BaseStatResource]

# formula to get the value?
var formula: Callable

func calculate() -> void:
	pass

# This might break if used as a resource since we can't call _init with null so don't
func _init(p_formula: Callable, p_stat_name: String = DEFAULT_STAT_NAME, p_value: int = DEFAULT_VALUE) -> void:
	super(p_stat_name, p_value)
	formula = p_formula