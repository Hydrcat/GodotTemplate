@tool
extends ManagerBase
class_name UIManager
## UI管理器

## 面板字典
# key:面板名字
# value:面板实例
var panel_dict: Dictionary
var ui_root: Node


func _init() -> void:
	# 初始化字典
	panel_dict = {} 
	# 获取根节点
	
	
func open_panel(panel: UIBasePanel) -> void:
	var t := try_get(panel.name)
	if t:
		t.root.show()
		t._on_show()
	else:
		## 创建对应的面板
		var panel_res := load(panel.path) as PackedScene
		var new_panel := panel_res.instantiate() as UIBasePanel
		## 在对应的面板下加到子节点
		
		
func try_get(panel_key: String) -> UIBasePanel:
	var temp_panel = panel_dict.get(panel_key)
	if temp_panel:
		return temp_panel as UIBasePanel
	else:
		return null
