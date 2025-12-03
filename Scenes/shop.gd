extends Control
@onready var pet_buy_1_container: PanelContainer = $VBoxContainer/Shop/PetShop/PetBuy1Container
@onready var pet_buy_2_container: PanelContainer = $VBoxContainer/Shop/PetShop/PetBuy2Container
const FOCUS_ON = preload("uid://bwt5swwobyubs")
const FOCUS_OFF = preload("uid://b64nvevmuhvdb")

func _ready() -> void:
	pet_buy_1_container.focus_mode = FOCUS_ALL
	pet_buy_2_container.focus_mode = FOCUS_ALL
	pet_buy_1_container.grab_focus()
	if pet_buy_1_container.has_focus():
		print("FOCUS")



func _on_pet_buy_1_container_focus_entered() -> void:
	pet_buy_1_container.add_theme_stylebox_override("panel",FOCUS_ON)
	print("1 FOCUS")

func _on_pet_buy_1_container_focus_exited() -> void:
	pet_buy_1_container.add_theme_stylebox_override("panel",FOCUS_OFF)
	print("1 NO FOCUS")


func _on_pet_buy_2_container_focus_entered() -> void:
	pet_buy_2_container.add_theme_stylebox_override("panel",FOCUS_ON)
	print("2 FOCUS")

func _on_pet_buy_2_container_focus_exited() -> void:
	pet_buy_2_container.add_theme_stylebox_override("panel",FOCUS_OFF)
	print("2 NO FOCUS")
