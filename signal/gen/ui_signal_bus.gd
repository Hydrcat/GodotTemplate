extends UISignalBusCustom
class_name UISignalBus

# HydrcatFramework 自动生成
# 请勿修改

static var instance: UISignalBus

func _ready() -> void:
	assert(instance == null,"单例已存在:"+"UISignalBus")
	instance = self
signal test_signal()
