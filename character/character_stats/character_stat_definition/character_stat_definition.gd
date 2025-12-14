extends Resource
class_name CharacterStatDefinition

# Write more SHARED data template stuff here
# Don't use for immediate character state
# Intended to be read-only at runtime. 
# Don't think i'd ever need a new definition at runtime, 
# they can all be made ahead of time in editor

@export var _stat_name: String = "default_stat_name"
var stat_name: String:
    get: return _stat_name

@export var _min_value: int = 0
var min_value: int:
    get: return _min_value

@export var _max_value: int = 999
var max_value: int:
    get: return _max_value
