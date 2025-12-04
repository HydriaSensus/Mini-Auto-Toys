class_name ToyAbility
extends Resource

enum TriggerList {TurnEnded, BattleStarted, Hurted, Fainted, KnockOut, FriendSummoned, FriendAheadAttacked, FriendAheadHurted, FriendFainted}
@export var trigger: TriggerList
@export var ability_limit:int = 0
var ability_uses:int = 0

func effect(name) -> void:
	if ability_limit:
		if ability_uses >= ability_limit:
			print("Ability didn't activate due to limit")
			return
		ability_uses +=1
	print(name,"Ability activated on ",TriggerList.find_key(trigger))
