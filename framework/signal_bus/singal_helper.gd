extends Resource
class_name SignalHelper

@export var generate_button: bool:
	set(v):
		collect_signal()

@export var singal_bus_name: StringName
@export var singal_configs: Array[SignalConfig]

## 收集信号
func collect_signal() -> void:
	# 清理之前的信号配置
	Log.info("清理代码")
	clear_folder("res://framework/signal_bus/gen/")
	# 生成信号代码
	Log.info("信号代码生成")
	var codes := generate_signal_code()
	generate_code_file(codes, "res://framework/signal_bus/gen/"+singal_bus_name+".gd")
	# 生成完毕
	Log.info("生成完毕")

## 清理指定文件夹下所有文件
func clear_folder(folder_path: String) -> void:
	var dir = DirAccess.open(folder_path)
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		dir.remove(file_name)
		file_name = dir.get_next()
	dir.list_dir_end()

## 生成代码信号
func generate_signal_code() -> String:
	var singals_code :String 
	# 加载模板
	singals_code = load_text_file("res://framework/signal_bus/singal_bus_template.txt")
	singals_code = singals_code.replace("{class_name}", singal_bus_name)
	for config in singal_configs:
		var signal_name = config.singal_name
		var signal_code = "signal " + signal_name + "("
		for param in config.params:
			signal_code += param.name + " :" + param.type + ","
		signal_code += ")\n"
		Log.info(signal_code)
		Log.info("生成完毕")
		singals_code += signal_code
	return singals_code

## 生成代码文件
func generate_code_file(code: String, file_path: String) -> void:
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(code)
	file.close()

func load_text_file(file_path: String) -> String:
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return content