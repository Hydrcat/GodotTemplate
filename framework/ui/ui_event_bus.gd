extends Node
class_name UIEventBus


var signal_dict :Dictionary = {}

## 事件总线注册某信号
func register_signal(s: Signal,s_name:StringName) -> void:
	signal_dict[s_name] = s

## 事件总线解绑
func unregister_signal(s: Signal,callable:Callable) -> void:
	s.disconnect(callable)

## 


		