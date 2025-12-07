@tool
class_name ConeSnailAbility
extends ToyAbility

func effect():
	super()
	var objective = null
	var parent := toy_node.get_parent()
	var i := toy_node.get_index()
	if parent and i + 1 < parent.get_child_count():
		objective = parent.get_child(i + 1)
		objective.toy.current_hp += 2*toy_node.toy.level
		objective.hp_label.text = str(objective.toy.current_hp)
		print(str(toy_node.toy.toy_name,": Start of battle → Give the nearest friend behind +",2*toy_node.toy.level," health."))
