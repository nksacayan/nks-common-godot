extends Label
class_name BaseStatLabel

var base_stat: BaseStat:
	set(p_stat):
		# 1. Cleanup old stat if it exists
		if base_stat and base_stat.value_changed.is_connected(_set_label_text):
			base_stat.value_changed.disconnect(_set_label_text)
		
		base_stat = p_stat
		
		# 2. Setup new stat
		if base_stat:
			base_stat.value_changed.connect(_set_label_text)
			# Only update if the Label is actually in the tree
			if is_inside_tree():
				_set_label_text()

func _ready() -> void:
	# Initial draw
	_set_label_text()

func _set_label_text(_p_ignored_value: int = 0) -> void:
	if base_stat:
		text = str(base_stat.stat_name, ": ", base_stat.value)
	else:
		text = "No Stat"
