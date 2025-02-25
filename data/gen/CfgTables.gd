#  <auto-generated>
#    This code was generated by a tool.
#    Changes to this file may cause incorrect behavior and will be lost if
#    the code is regenerated.
#  </auto-generated>

extends RefCounted
class_name CfgTables

## 表单管理类 单例
const json_path:String = "res://data/json/"

static var instance : CfgTables
static var TbCard: TbCard
static var TbCardPile: TbCardPile
static var TbEntity: TbEntity
static var TbNewConfig: TbNewConfig

func loader(file_name:String):
    var json_file = FileAccess.open(json_path + file_name + ".json", FileAccess.READ)
    var json_text = json_file.get_as_text()
    json_file.close()
    return JSON.parse_string(json_text)


func _init() -> void:
    assert(instance == null,"gen:不要重复初始化CfgTables")

    self.TbCard = TbCard.new(loader.call('tbcard'))
    self.TbCardPile = TbCardPile.new(loader.call('tbcardpile'))
    self.TbEntity = TbEntity.new(loader.call('tbentity'))
    self.TbNewConfig = TbNewConfig.new(loader.call('tbnewconfig'))

