@tool
class_name ConeSnailAbility
extends ToyAbility
const DAMAGE_INDICATOR = preload("uid://b0geur5as2gwr")

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
		printed.emit(str(toy_node.toy.toy_name,": Start of battle → Give the nearest friend behind +",2*toy_node.toy.level," health."))

		var display:Label = DAMAGE_INDICATOR.instantiate()
		toy_node.get_tree().current_scene.add_child(display)
		display.text = str("+",2*toy_node.toy.level)
		#display.modulate=Color.GREEN
		display.global_position = objective.global_position+Vector2(4,20)
		display.animate_pop()
