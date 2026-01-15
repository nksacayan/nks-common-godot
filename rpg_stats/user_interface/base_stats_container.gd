extends Container
class_name BaseStatsContainer

@export var label_packed_scene: PackedScene

var base_stats: Array[BaseStat]:
	set(p_base_stats):
		base_stats = p_base_stats
		# Ensure we only build UI if we are in the tree
		if is_node_ready():
			_update_ui()

# No need to track stat_labels in a separate array if they are children
# unless you need to access them specifically later.

func _ready() -> void:
	_update_ui()

func _update_ui() -> void:
	_clear_labels()
	
	if not label_packed_scene:
		push_warning("BaseStatsContainer: label_packed_scene is missing!")
		return

	for stat in base_stats:
		_create_label(stat)

func _clear_labels() -> void:
	# Clear actual children to ensure the UI is physically empty
	for child in get_children():
		child.queue_free()

func _create_label(p_stat: BaseStat) -> void:
	var instance = label_packed_scene.instantiate()
	var new_label = instance as BaseStatLabel
	
	if new_label:
		# Set the data BEFORE adding to child to ensure _ready() 
		# in the label has the data it needs.
		new_label.base_stat = p_stat
		add_child(new_label)
	else:
		# Safety: If it's not the right type, free it so we don't leak memory
		instance.queue_free()
		push_error("BaseStatsContainer: PackedScene is not a BaseStatLabel!")
