extends Resource
class_name CharacterStat

var stat_definition: CharacterStatDefinition
var value: int

func _init(p_stat_definition: CharacterStatDefinition = CharacterStatDefinition.new(), p_value: int = p_stat_definition.min_value) -> void:
    stat_definition = p_stat_definition
    value = p_value