extends Label
class_name BoundedStatLabel

# TODO: Refactor this and base stat label. The only difference is the input type and string
var bounded_stat: BoundedStat:
	set(p_stat):
		# 1. Cleanup old stat if it exists
		if bounded_stat:
			if bounded_stat.value_changed.is_connected(_set_label_text):
				bounded_stat.value_changed.disconnect(_set_label_text)
			if bounded_stat.max_stat.value_changed.is_connected(_set_label_text):
				bounded_stat.max_stat.value_changed.disconnect(_set_label_text)
		
		bounded_stat = p_stat
		
		# 2. Setup new stat
		if bounded_stat:
			bounded_stat.value_changed.connect(_set_label_text)
			bounded_stat.max_stat.value_changed.connect(_set_label_text)
			# Only update if the Label is actually in the tree
			if is_inside_tree():
				_set_label_text()

func _ready() -> void:
	# Initial draw
	_set_label_text()

func _set_label_text(_p_ignored_value: int = 0) -> void:
	if bounded_stat:
		text = str(bounded_stat.max_stat.stat_name, ": ", bounded_stat.current_value, "/", bounded_stat.max_stat.value);
	else:
		text = "No Stat"
