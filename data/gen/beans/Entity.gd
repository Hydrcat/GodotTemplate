#  <auto-generated>
#    This code was generated by a tool.
#    Changes to this file may cause incorrect behavior and will be lost if
#    the code is regenerated.
#  </auto-generated>

extends RefCounted
class_name Entity

## 人物id
var id: int
## 名称
var sname: String
## 描述
var desc: String
## 图像
var visual_path: String
## 最大hp
var max_hp: int
## 初始防御
var init_defend: int
## 最大法力值
var max_mana: int
## 牌组id
var card_pile_id: int

func _init(_json_) -> void:
    self.id = _json_["id"]
    self.sname = _json_["sname"]
    self.desc = _json_["desc"]
    self.visual_path = _json_["visual_path"]
    self.max_hp = _json_["max_hp"]
    self.init_defend = _json_["init_defend"]
    self.max_mana = _json_["max_mana"]
    self.card_pile_id = _json_["card_pile_id"]


