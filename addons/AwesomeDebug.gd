extends Node

var enabled = true setget set_enabled, get_enabled
var time_start
var time_end

func _ready():
	pass
	
func _format_vector3(arg):
	return "X: %12s| Y: %12s| Z: %12s|" % [arg.x, arg.y, arg.z]	
	
func _format_print(prefix, stack, type, formatted_arg):
	
	if self.enabled:
		print("%s| " % prefix + "%9s| " % [type] + "%20s: " % "" + "%-50s" % [formatted_arg] + "%15s %4s %s" % [stack.function, stack.line, stack.source])

func _format_print_wtih_desc(prefix, stack, type, desc, formatted_arg):
#	var formatted_arg = 'null'
#	if arg != null:
#		if type == 'object':
#			print(arg)
#			if arg.has_method("to_string"):
#				formatted_arg = arg.to_string() + ' ' + arg.get('name')
#			else:
#				formatted_arg = String(arg) + ' ' + arg.get('name')
#		else:
#			formatted_arg = String(arg)
	if self.enabled:
		print("%s| " % prefix + "%9s| " % [type] + "%20s: " % desc + "%-50s" % [formatted_arg] + "%15s %4s %s" % [stack.function, stack.line, stack.source])

func time_check_start():
	time_start = OS.get_unix_time()
	
func time_check_stop():
	var PREFIX = OS.get_unix_time()
	var STACK = get_stack()[1]
	if self.enabled:	
		print(String(PREFIX) + "| " + "%s" % (time_start - PREFIX) + String(STACK))
	

func time_check():
	var PREFIX = OS.get_unix_time()
	var STACK = get_stack()[1]
	if self.enabled:	
		print(String(PREFIX) + "| " + String(STACK))

func set_enabled(arg):
	enabled = arg
	
func get_enabled():
	return enabled

func enable():
	self.enabled = true

func disable():
	self.enabled = false

func off_d(description, arg):
	return arg

func off(arg):
	return arg

func d(description, arg):
	#var DEFAULT_PREFIX = 'ic| '
	var DEFAULT_PREFIX = OS.get_unix_time()
	var TYPE = ''
	var STACK = get_stack()[1]
	match typeof(arg):
		TYPE_NIL:
			TYPE = 'nil'
		TYPE_BOOL:
			TYPE = 'bool'
		TYPE_INT:
			TYPE = 'int'
		TYPE_REAL:
			TYPE = 'real'
		TYPE_STRING:
			TYPE = 'string'
		TYPE_VECTOR2:
			TYPE = 'vector2'
		TYPE_VECTOR3:
			TYPE = 'vector3'
		TYPE_AABB:
			TYPE = 'aabb'
		TYPE_TRANSFORM:
			TYPE = 'transfrom'
		TYPE_COLOR:
			TYPE = 'color'
		TYPE_NODE_PATH:
			TYPE = 'node path'
		TYPE_RID:
			TYPE = 'RID'
		TYPE_OBJECT:
			TYPE = 'object'
		TYPE_DICTIONARY:
			TYPE = 'dict'
		TYPE_ARRAY:
			TYPE = 'array'
		TYPE_RAW_ARRAY:
			TYPE = 'raw array'
		TYPE_INT_ARRAY:
			TYPE = 'int array'
		TYPE_REAL_ARRAY:
			TYPE = 'real array'
		TYPE_STRING_ARRAY:
			TYPE = 'string array'
		TYPE_VECTOR2_ARRAY:
			TYPE = 'vector2 array'
		TYPE_VECTOR3_ARRAY:
			TYPE = 'vector3 array'
		TYPE_COLOR_ARRAY:
			TYPE = 'color array'
		TYPE_MAX:
			TYPE = 'max'
	var formatted_arg = 'null'
	if arg != null:
		if TYPE == 'object':
			formatted_arg = arg.to_string() + ' ' + arg.get_class()#+ arg.get('name')
		elif TYPE == 'vector3':
			formatted_arg = _format_vector3(arg)
		else:	
			formatted_arg = String(arg)
					
	_format_print_wtih_desc(DEFAULT_PREFIX, STACK, TYPE, description, formatted_arg)
	return arg

func p(arg):
	#var DEFAULT_PREFIX = 'ic| '
	var DEFAULT_PREFIX = OS.get_unix_time()
	var TYPE = ''
	var STACK = get_stack()[1]
	match typeof(arg):
		TYPE_NIL:
			TYPE = 'nil'
		TYPE_BOOL:
			TYPE = 'bool'
		TYPE_INT:
			TYPE = 'int'
		TYPE_REAL:
			TYPE = 'real'
		TYPE_STRING:
			TYPE = 'string'
		TYPE_VECTOR2:
			TYPE = 'vector2'
		TYPE_VECTOR3:
			TYPE = 'vector3'
		TYPE_AABB:
			TYPE = 'aabb'
		TYPE_TRANSFORM:
			TYPE = 'transfrom'
		TYPE_COLOR:
			TYPE = 'color'
		TYPE_NODE_PATH:
			TYPE = 'node path'
		TYPE_RID:
			TYPE = 'RID'
		TYPE_OBJECT:
			TYPE = 'object'
		TYPE_DICTIONARY:
			TYPE = 'dict'
		TYPE_ARRAY:
			TYPE = 'array'
		TYPE_RAW_ARRAY:
			TYPE = 'raw array'
		TYPE_INT_ARRAY:
			TYPE = 'int array'
		TYPE_REAL_ARRAY:
			TYPE = 'real array'
		TYPE_STRING_ARRAY:
			TYPE = 'string array'
		TYPE_VECTOR2_ARRAY:
			TYPE = 'vector2 array'
		TYPE_VECTOR3_ARRAY:
			TYPE = 'vector3 array'
		TYPE_COLOR_ARRAY:
			TYPE = 'color array'
		TYPE_MAX:
			TYPE = 'max'
	var formatted_arg = 'null'
	if arg != null:
		if TYPE == 'object':
			formatted_arg = arg.to_string() + ' ' + arg.get_class()#+ arg.get('name')
		elif TYPE == 'vector3':
			formatted_arg = _format_vector3(arg)
		else:	
			formatted_arg = String(arg)
					
	_format_print(DEFAULT_PREFIX, STACK, TYPE, formatted_arg)
	return arg





