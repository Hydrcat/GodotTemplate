extends ManagerBase
class_name SignalBusManager

@export var signal_buss:Array[SignalHelper]

# 玩家自定义信号总线初始化
func _enter_tree() -> void:
	init()
	pass

func init() -> void:
	var scripts := HydrcatFramework.asset_manager.load_group_asset("signal_bus") as Array[Resource]
	for script in scripts:
		var s := script as GDScript
		var signal_bus := s.new() as SignalBus
		add_child(signal_bus)