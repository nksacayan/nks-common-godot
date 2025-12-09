extends RefCounted
class_name UtilsNks

static func get_function_name() -> String:
    var stack = get_stack()
    if stack.size() > 0:
        return stack[0].function
    return "Unknown"