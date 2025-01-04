extends Control
class_name UIPanel
'''
UIPanel UI框架基础的组成单元
'''

## 父Panel
@export var parent_panel: UIPanel

## 节点位置,相对父Panel的节点位置
@export var node_path: NodePath = "."

## Panel的初始化
func init() -> void:
    pass

## panel的显示
func panel_show() -> void:
    show()
    
## panel的隐藏
func panel_hide() -> void:
    hide()

## panel的销毁
func panel_destroy() -> void:
    queue_free()
