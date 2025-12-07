@tool
extends Container
class_name ReverseHBoxContainer

@export var separation: int = 8

func _notification(what: int) -> void:
	if what == NOTIFICATION_SORT_CHILDREN:
		_reposition_children()

func _get_minimum_size() -> Vector2:
	var total_width: int = 0
	var max_height: int = 0

	for child in get_children():
		if child is Control:
			var child_min_size: Vector2 = (child as Control).get_minimum_size()
			total_width += int(child_min_size.x) + separation
			max_height = max(max_height, int(child_min_size.y))

	if total_width > 0:
		total_width -= separation  # quitar la separación extra final

	return Vector2(total_width, max_height)


func _reposition_children() -> void:
	var container_size: Vector2 = size
	var x: float = container_size.x
	var visible_children: Array[Control] = []

	# Filtrar solo hijos Control visibles
	for child in get_children():
		if child is Control and child.visible:
			visible_children.append(child as Control)

	# Posicionar de derecha a izquierda
	for child in visible_children:
		var h_size: Vector2 = child.get_combined_minimum_size()

		x -= h_size.x
		child.position = Vector2(
			x,
			int((container_size.y - h_size.y) * 0.5)
		)

		x -= separation
