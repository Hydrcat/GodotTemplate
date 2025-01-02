extends ManagerBase
class_name AssetManager

# 资源管理器
@export var asset_colllector: AssetHelper

## 加载资源，目前只是封装
static func load(path: String) -> Resource:
	return load(path) as Resource

