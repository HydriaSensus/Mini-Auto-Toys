@tool
class_name SilkmothAbility
extends ToyAbility

func effect() -> void:
	super()
	print(pet_node.toy.name,": Friend ahead hurt → Give it +1 health. Works 2 times per turn.")
