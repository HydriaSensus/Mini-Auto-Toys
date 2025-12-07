@tool
class_name CricketAbility
extends ToyAbility
var zombie_cricket = preload("uid://uirqd1t2jb3f")

signal summon(pet,summoner_team,summoner_index)

func effect():
	super()
	var stats = toy_node.toy.level
	print(toy_node.toy.toy_name,": Faint → Summon one ",stats,"/",stats," Zombie Cricket.")
	zombie_cricket.level=stats
	zombie_cricket.atk=stats
	zombie_cricket.hp=stats
	summon.emit(zombie_cricket,toy_node.get_parent(),toy_node.get_index())
