extends Resource
class_name CharacterStat

var stat_definition: CharacterStatDefinition
var value: int

func _init(p_stat_definition := CharacterStatDefinition.new(), p_value := 1) -> void:
    stat_definition = p_stat_definition
    value = p_value