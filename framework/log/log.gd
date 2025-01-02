extends Node
class_name Log
# 日志


## 提示
static func info(msg: String) -> void:
	print_debug(msg)

## 警告
static func warn(msg: String) -> void:
	print_debug(msg)

## 错误
static func error(msg: String) -> void:
	print_debug(msg)