extends Node
class_name ManagerBase
## manger的基类，所有manger都继承自这个类

static var instance: ManagerBase = null

static func get_instance() -> ManagerBase:
	return instance

func _ready() -> void:
	assert(instance == null, "{manager_name} has been created".format({"manager_name": Utils.get_type_name(self)}))
	instance = self
