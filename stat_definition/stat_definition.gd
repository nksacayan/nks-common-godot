extends Resource
class_name StatDefinition

@export var name: String
@export var min_value: int
@export var max_value: int
# Write more SHARED data template stuff here
# Don't use for immediate character state

func _init(p_name = "DEFAULT STAT NAME", p_min_value = 0, p_max_value = 999) -> void:
    name = p_name
    min_value = p_min_value
    max_value = p_max_value