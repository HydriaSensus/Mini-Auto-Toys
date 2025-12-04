class_name CricketAbility
extends ToyAbility
var zombie_cricket = preload("uid://uirqd1t2jb3f")

signal summon(pet,summoner_index)

func effect(name) -> void:
	super(name)
	print("Faint → Summon one 1/1 Zombie Cricket.")
	zombie_cricket.level=pet_node.toy.level
	zombie_cricket.atk=zombie_cricket.level
	zombie_cricket.hp=zombie_cricket.level
	summon.emit(zombie_cricket,pet_node.get_index())
