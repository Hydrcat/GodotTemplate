@tool
extends Control

@onready var res_path: LineEdit = $VBoxContainer/HBoxContainer/res_path
@onready var open_path_button: Button = $VBoxContainer/open_path_button
@onready var export_button: Button = $VBoxContainer/export_button
@onready var refresh_button: Button = $VBoxContainer/HBoxContainer/refresh_button

@onready var excel_list: VBoxContainer = $VBoxContainer/ScrollContainer/ExcelList
@onready var button_template:= preload("res://addons/luban_godot/button_template.tscn")

var _path :String
var _pids :Array[int]
var _bat_name :String
var _post_process_name :String

var luban_tools_path :="res://addons/luban_godot/LubanTool"
var gen_path :="res://data"
var template_folder := "res://addons/luban_godot/template_folder"


var export_command :PackedStringArray =[]

func _ready() -> void:
	open_path_button.pressed.connect(open_path)
	export_button.pressed.connect(export)
	refresh_button.pressed.connect(refresh)
	export_button.disabled = true


func open_path()->void:
	var path := "res://" + res_path.text
	var dir := DirAccess.open(path)
	if not dir :
		new_dir(path)
		dir=DirAccess.open(path)
	open_folder(path)

func refresh()->void:
	for pid in _pids:
		OS.kill(pid)
	for child in excel_list.get_children():
		child.queue_free()

	var path := "res://" + res_path.text
	var dir := DirAccess.open(path)
	if not dir :
		new_dir(path)
		dir=DirAccess.open(path)
		
	_path = path
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			print("发现目录：" + file_name)
		else:
			print("发现文件：" + file_name)
			if file_name.match("*.xlsx"):
				var button := Button.new()
				button.pressed.connect(open_excel.bind(file_name))
				button.name = file_name
				button.text = file_name
				excel_list.add_child(button)
			elif file_name.match("gen.bat"):
				_bat_name = file_name
				print("bat已找到")
			elif file_name.match("post_process.bat"):
				_post_process_name = file_name
				print("后处理bat已找到")
		file_name = dir.get_next()
	export_button.disabled = false

func new_dir(dir_path)->void:
	DirAccess.make_dir_absolute(dir_path)
	


func open_excel(excel_name)->void:
	var output = []
	var abs_path = translate_path(_path+"/"+excel_name)
	#OS.execute("CMD.exe", ["/C", abs_path], output)
	var pid = OS.create_process("CMD.exe",["/C", abs_path])
	_pids.append(pid)
	#OS.shell_show_in_file_manager(abs_path, true)
	print(output)
	
func open_folder(path) -> void:
	var output = []
	OS.shell_show_in_file_manager(translate_path(path), true)
	#OS.execute("start",[translate_path(path)],output,true,true)
	print(output)

func translate_path(path:String) -> String:
	return ProjectSettings.globalize_path(path)

func export()->void:
	var bat_path = translate_path(_path+"/"+_bat_name)
	var excel_path = translate_path(_path)
	#var pp_path = translate_path(_path+"/"+_post_process_name)
	var output = []
	#var pid = OS.create_process("powershell.exe",["/C","cd _excel&&"+abs_path],true)
	OS.execute("powershell.exe", ["/C", "cd "+excel_path,"\n",bat_path], output)
	better_print_debug(output)

func better_print_debug(words:PackedStringArray)->void:
	var sort_words:PackedStringArray = []
	for word in words:
		var temps := word.split("\n")
		sort_words.append_array(temps)
	
	for word in sort_words:
		print_debug(word)

	
