@tool
class_name MothAbility
extends ToyAbility
var objective:Node = pet_node

func effect() -> void:
	super()
	for child:Node in pet_node.get_parent().get_children():
		if child.is_in_group("Toy"):
			objective = child
			break
	objective.toy.atk += 2*pet_node.toy.level
	objective.atk_label.text = str(objective.toy.atk)
	print(str(pet_node.toy.name,": Start of battle → Give front-most friendly pet +",2*pet_node.toy.level," attack."))
