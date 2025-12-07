@tool
class_name MothAbility
extends ToyAbility
var objective:Node = toy_node
const DAMAGE_INDICATOR = preload("uid://b0geur5as2gwr")

func effect():
	super()
	for child:Node in toy_node.get_parent().get_children():
		if child.is_in_group("Toy"):
			objective = child
			break
	objective.toy.atk += 2*toy_node.toy.level
	objective.atk_label.text = str(objective.toy.atk)
	print(str(toy_node.toy.toy_name,": Start of battle → Give front-most friendly pet +",2*toy_node.toy.level," attack."))
	printed.emit(str(toy_node.toy.toy_name,": Start of battle → Give front-most friendly pet +",2*toy_node.toy.level," attack."))

	var display:Label = DAMAGE_INDICATOR.instantiate()
	toy_node.get_tree().current_scene.add_child(display)
	display.text = str("+",2*toy_node.toy.level)
	display.global_position = objective.global_position+Vector2(-4,20)
	display.animate_pop()
