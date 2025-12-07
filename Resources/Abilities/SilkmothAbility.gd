@tool
class_name SilkmothAbility
extends ToyAbility

func effect():
	if super():
		var objective = null
		var parent := pet_node.get_parent()
		var i := pet_node.get_index()
		objective = parent.get_child(i - 1)
		objective.toy.current_hp += pet_node.toy.level
		objective.hp_label.text = str(objective.toy.current_hp)
		print(pet_node.toy.name,": Friend ahead hurt → Give it +",pet_node.toy.level," health. Works 2 times per turn.")
		print(objective.toy.name," HP left: ",objective.toy.current_hp)

func _on_toy_hurted(team,index)-> void:
	if team == pet_node.get_parent() and index == pet_node.get_index()-1:
		effect()
