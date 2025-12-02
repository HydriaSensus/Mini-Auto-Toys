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

signal attacked(damage)
signal fainted

var current_hp:int = 0



func _ready() -> void:
	current_hp = hp

func attack():
	attacked.emit(atk)

func hurt(damage):
	current_hp -= damage
	print(str(name," took ",damage," damage. HP left: ",current_hp))
	if ability.trigger == ToyAbility.TriggerList.Hurted:
		ability.effect()
	if current_hp <= 0:
		faint()
	
func faint():
	print(str(name," fainted"))
	if ability.trigger == ToyAbility.TriggerList.Fainted:
		ability.effect()
	fainted.emit()
	
func use_ability():
	ability.effect()
