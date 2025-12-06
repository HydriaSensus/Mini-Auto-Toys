@tool
class_name MosquitoAbility
extends ToyAbility

signal damage(value,objective_team,objective_index)

var objective_count:int
var objective_team:Node = null

func effect() -> void:
	super()
	objective_count = pet_node.toy.level
	print(pet_node.toy.name,": Start of battle → Deal 1 damage to ",objective_count," random enemies.")
	if pet_node.get_parent().name == "PlayerTeam":
		objective_team = pet_node.get_parent().get_parent().find_child("EnemyTeam")
	elif pet_node.get_parent().name == "EnemyTeam":
		objective_team = pet_node.get_parent().get_parent().find_child("PlayerTeam")
	for i in objective_count:
		damage.emit(1,objective_team,null)
