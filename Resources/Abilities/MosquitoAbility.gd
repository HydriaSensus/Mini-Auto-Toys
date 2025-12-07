@tool
class_name MosquitoAbility
extends ToyAbility

signal damage(value,objective_team,objective_index)

var objective_count:int
var objective_team:Node = null

func effect():
	super()
	objective_count = toy_node.toy.level
	print(toy_node.toy.toy_name,": Start of battle → Deal 1 damage to ",objective_count," random enemies.")
	printed.emit(str(toy_node.toy.toy_name,": Start of battle → Deal 1 damage to ",objective_count," random enemies."))
	if toy_node.get_parent().name == "PlayerTeam":
		objective_team = toy_node.get_parent().get_parent().find_child("EnemyTeam")
	elif toy_node.get_parent().name == "EnemyTeam":
		objective_team = toy_node.get_parent().get_parent().find_child("PlayerTeam")
	for i in objective_count:
		damage.emit(1,objective_team,null)
