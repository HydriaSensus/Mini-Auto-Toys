@tool
class_name ToyStats
extends Resource

@export var toy_name:String
@export var sprite:Texture2D
@export var ability:ToyAbility

@export_range(1, 50) var atk:int=1
@export_range(1, 50, 1, "or_less") var hp:int=1

@export_range(1, 5) var tier:int=1
@export_range(1, 3) var level:int=1
@export_range(0, 100, 1, "or_greater") var xp:int=0

#@export var item: Item
const DAMAGE_MATERIAL = preload("uid://cwe8qlcwai53j")
var toy_node:Node
var current_hp:int = 0

signal attacked(damage)
signal hurted(node,damage)
signal fainted(node)



func _init() -> void:
	self.resource_local_to_scene = true

func ready() -> void:
	current_hp = hp
	ability.toy_node=toy_node

func attack():
	attacked.emit(atk)

func hurt(damage):
	current_hp -= damage
	print(str(toy_name," took ",damage," damage. HP left: ",current_hp))
	toy_node.hp_label.text = str(current_hp)
	toy_node.spriteNode.material=DAMAGE_MATERIAL
	await toy_node.get_tree().create_timer(0.1).timeout
	toy_node.spriteNode.material=null
	if ability:
		if ability.trigger == ToyAbility.TriggerList.Hurted:
			ability.effect()
	hurted.emit(toy_node,damage)
	if current_hp <= 0:
		faint()
	
func faint():
	print(str(toy_name," fainted"))
	if ability:
		if ability.trigger == ToyAbility.TriggerList.Fainted:
			ability.effect()
	fainted.emit(toy_node)
