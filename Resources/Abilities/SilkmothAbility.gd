@tool
class_name SilkmothAbility
extends ToyAbility
const DAMAGE_INDICATOR = preload("uid://b0geur5as2gwr")

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
		printed.emit(str(toy_node.toy.toy_name,": Friend ahead hurt → Give it +",toy_node.toy.level," health."))

		var display:Label = DAMAGE_INDICATOR.instantiate()
		toy_node.get_tree().current_scene.add_child(display)
		display.text = str("+",toy_node.toy.level)
		display.modulate=Color.GREEN
		display.global_position = objective.global_position+Vector2(12,24)
		display.animate_pop()

func _on_toy_hurted(team,index)-> void:
	if team == toy_node.get_parent() and index == toy_node.get_index()-1:
		effect()
