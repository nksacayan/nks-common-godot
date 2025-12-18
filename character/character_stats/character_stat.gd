extends Resource
class_name CharacterStat

signal value_changed(new_value: int)

@export var definition: CharacterStatDefinition
@export var value: int:
    set(p_value):
        value = p_value
        value_changed.emit(value)

func _init(p_stat_definition: CharacterStatDefinition = CharacterStatDefinition.new(), p_value: int = p_stat_definition.min_value) -> void:
    definition = p_stat_definition
    value = p_value