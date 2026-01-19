extends Container
class_name BoundedStatLabelContainer

# TODO: DRY with base_stat_label_container
@export var label_packed_scene: PackedScene

var bounded_stats: Array[BoundedStat]:
	set(p_base_stats):
		bounded_stats = p_base_stats
		_update_ui()

# No need to track stat_labels in a separate array if they are children
# unless you need to access them specifically later.

func _ready() -> void:
	_update_ui()

func _update_ui() -> void:
	if not is_node_ready():
		return
	_clear_labels()
	
	if not label_packed_scene:
		push_warning("BaseStatLabelContainer: label_packed_scene is missing!")
		return

	for stat in bounded_stats:
		_create_label(stat)

func _clear_labels() -> void:
	for child in get_children():
		remove_child(child) # Physically remove it so get_children() is accurate
		child.queue_free() # Then delete it

func _create_label(p_stat: BoundedStat) -> void:
	var instance = label_packed_scene.instantiate()
	var new_label = instance as BoundedStatLabel
	
	if new_label:
		# Set the data BEFORE adding to child to ensure _ready() 
		# in the label has the data it needs.
		new_label.bounded_stat = p_stat
		add_child(new_label)
	else:
		# Safety: If it's not the right type, free it so we don't leak memory
		instance.queue_free()
		push_error("BoundedStatLabelContainer: PackedScene is not a BoundedStatLabel!")
