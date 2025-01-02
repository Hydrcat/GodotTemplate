extends Node
class_name UIRoot
'''
UI根节点
'''

func _enter_tree() -> void:
	## 注册新的ui根节点
	HydrcatFramework.ui_manager.ui_root = self
