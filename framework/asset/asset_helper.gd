@tool
class_name AssetHelper extends Resource

# 资源助手
# 收集指定资源的位置，方便管理

@export var collect_button: bool:
	set(v):
		collect_asset()

@export_category("资源路径")
@export var asset_paths: Array[StringName]
@export var asset_path_dict: Dictionary


## 收集资源
func collect_asset() -> void:
	
	for path in asset_paths:
		find_resources_in_folder(path, "tscn")

## 收集指定地址的资源
func find_resources_in_folder(path: String, type: String):
	asset_path_dict = {}
	if path.is_empty():
		printerr("路径为空")
		return
	
	var dir := DirAccess.open(path)
	if not dir :
		printerr("文件夹不存在:",path)
		return

	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			print("发现目录：" + file_name)
		else:
			print("发现文件：" + file_name)

			# 场景
			if file_name.match("*.tscn"):
				asset_path_dict[file_name] = dir.get_current_dir(false)
		file_name = dir.get_next()
	
