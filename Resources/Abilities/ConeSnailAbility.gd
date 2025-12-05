@tool
class_name ConeSnailAbility
extends ToyAbility

func effect() -> void:
	super()
	var objective = null
	var parent := pet_node.get_parent()
	var i := pet_node.get_index()
	if parent and i + 1 < parent.get_child_count():
		objective = parent.get_child(i + 1)
		objective.toy.current_hp += 2*pet_node.toy.level
		objective.hp_label.text = str(objective.toy.current_hp)
		print(str(pet_node.toy.name,": Start of battle → Give the nearest friend behind +",2*pet_node.toy.level," health."))
