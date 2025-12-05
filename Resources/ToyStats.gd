@tool
class_name ToyStats
extends Resource

@export var name:String
@export var sprite:Texture2D
@export var ability:ToyAbility

@export_range(1, 50) var atk:int=1
@export_range(1, 50, 1, "or_less") var hp:int=1

@export_range(1, 5) var tier:int=1
@export_range(1, 3) var level:int=1
@export_range(0, 100, 1, "or_greater") var xp:int=0

#@export var item: Item

var pet_node:Node

signal attacked(damage)
signal hurted
signal fainted

var current_hp:int = 0

func _init() -> void:
	self.resource_local_to_scene = true

func ready() -> void:
	current_hp = hp
	ability.pet_node=pet_node

func attack():
	attacked.emit(atk)

func hurt(owner,damage):
	current_hp -= damage
	print(str(name," took ",damage," damage. HP left: ",current_hp))
	owner.hp_label.text = str(current_hp)
	if ability:
		if ability.trigger == ToyAbility.TriggerList.Hurted:
			ability.effect()
	hurted.emit()
	if current_hp <= 0:
		faint()
	
func faint():
	print(str(name," fainted"))
	if ability:
		if ability.trigger == ToyAbility.TriggerList.Fainted:
			ability.effect()
	fainted.emit()
