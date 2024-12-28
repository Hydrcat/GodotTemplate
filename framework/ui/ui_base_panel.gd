extends Control
class_name UIBasePanel
'''
UIPanel UI框架基础的组成单元
'''

var path: String
@export var root: Control


func _init(_path: String) -> void:
	path = _path

func _on_show() -> void:
	pass
	
func _on_hide() -> void:
	pass
