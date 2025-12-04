class_name CricketAbility
extends ToyAbility
const BLUEBIRD = preload("uid://cvj5meur2dhwg")

signal summon(pet,summoner_index)

func effect(name) -> void:
	super(name)
	print("Faint → Summon one 1/1 Zombie Cricket.")
	summon.emit(BLUEBIRD,pet_node.get_index())
