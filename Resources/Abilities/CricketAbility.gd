@tool
class_name CricketAbility
extends ToyAbility
var zombie_cricket = preload("uid://uirqd1t2jb3f")

signal summon(pet,summoner_team,summoner_index)

func effect() -> void:
	super()
	var stats = pet_node.toy.level
	print(pet_node.toy.name,": Faint → Summon one ",stats,"/",stats," Zombie Cricket.")
	zombie_cricket.level=stats
	zombie_cricket.atk=stats
	zombie_cricket.hp=stats
	summon.emit(zombie_cricket,pet_node.get_parent(),pet_node.get_index())
