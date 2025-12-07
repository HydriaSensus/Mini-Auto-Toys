@tool
class_name SilkmothAbility
extends ToyAbility

func effect():
	if super():
		var objective = null
		var parent := toy_node.get_parent()
		var i := toy_node.get_index()
		objective = parent.get_child(i - 1)
		objective.toy.current_hp += toy_node.toy.level
		objective.hp_label.text = str(objective.toy.current_hp)
		print(toy_node.toy.toy_name,": Friend ahead hurt → Give it +",toy_node.toy.level," health. Works 2 times per turn.")
		print(objective.toy.toy_name," HP left: ",objective.toy.current_hp)

func _on_toy_hurted(team,index)-> void:
	if team == toy_node.get_parent() and index == toy_node.get_index()-1:
		effect()
