@tool
class_name ToyAbility
extends Resource

enum TriggerList {TurnEnded, BattleStarted, Hurted, Fainted, KnockOut, FriendSummoned, FriendAheadAttacked, FriendAheadHurted, FriendFainted}
@export var trigger: TriggerList
@export var ability_limit:int = 0
var ability_uses:int = 0
var pet_node:Node

func _init() -> void:
	self.resource_local_to_scene = true

func effect() -> bool:
	if ability_limit:
		if ability_uses >= ability_limit:
			print(pet_node.toy.name,": Ability didn't activate due to limit")
			return false
		ability_uses +=1
	return true
