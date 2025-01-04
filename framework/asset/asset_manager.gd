extends ManagerBase
class_name AssetManager

# 资源管理器
@export var asset_colllector: AssetHelper

## 加载资源，目前只是封装
static func load(path: String) -> Resource:
	return load(path) as Resource

## 按名,获取资源路径
func get_asset_path(asset_type: StringName, asset_name: StringName) -> StringName:
	return asset_colllector.get_asset_path(asset_type, asset_name)

## 按名，加载资源
func load_asset(asset_type: StringName, asset_name: StringName) -> Resource:
	var path: String = get_asset_path(asset_type, asset_name)
	if path.is_empty():
		printerr("资源不存在:", asset_name)
		return null
	return load(path) as Resource

## TODO:异步加载资源
func load_asset_async(asset_type: StringName, asset_name: StringName) -> void:
	pass