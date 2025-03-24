extends Node
class_name ConfigManager

var cfg : CfgTables

func _ready() -> void:
	cfg = CfgTables.new()
