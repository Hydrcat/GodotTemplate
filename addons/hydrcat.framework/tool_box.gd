@tool
extends Node

const framework_files := "res://framework/"
const GEN_HELPER := preload("res://framework/_settings/need_gen_helper.tres")

func _enter_tree() -> void:
	$Button.pressed.connect(regen_all)

func regen_all() -> void:
	GEN_HELPER.gen()
	
	for need_gen in GEN_HELPER.need_gens:
		need_gen.gen()
