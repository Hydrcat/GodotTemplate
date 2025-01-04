@tool
extends ManagerBase
class_name UIManager
## UI管理器

## UIPanel的容器
var panel_dict: Dictionary

## 根节点,会在根节点初始化的时候告知管理器
var ui_root: UIRoot


func _ready() -> void:
	init()
		

## 初始化
func init() -> void:
	if ui_root == null:
		printerr("UIRoot未初始化")
		return
	panel_dict = {}
	

## 打开指定的UIPanel
func open_panel(panel_name: StringName) -> UIPanel:
	if panel_dict.has(panel_name):
		var panel: UIPanel = panel_dict[panel_name]
		panel.show()
		return panel
		
	else:
		## panel不存在，则尝试加载
		var packed_scene := HydrcatFramework.asset_manager.load_asset("ui", panel_name) as PackedScene
		var panel_instance := packed_scene.instance() as UIPanel
		if panel_instance == null:
			Log.info("UIPanel加载失败:{panel_name}".format({"panel_name": panel_name}))
			return
		panel_instance.init()
		var father_panel := open_panel(panel_name) as UIPanel
		var father_node := ui_root.get_node(father_panel.node_path)
		assert(father_node != null, "父节点不存在")
		father_node.add_child(panel_instance)
		return panel_instance

## 关闭指定的UIPanel
func close_panel(panel_name: StringName) -> void:
	if panel_dict.has(panel_name):
		var panel: UIPanel = panel_dict[panel_name]
		panel.hide()
	else:
		Log.info("UIPanel不存在:{panel_name}".format({"panel_name": panel_name}))