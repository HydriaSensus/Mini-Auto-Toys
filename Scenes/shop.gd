extends Control
@onready var pet_buy_1: Button = $VBoxContainer/Shop/PetShop/PetBuy1


func _ready() -> void:
	pet_buy_1.grab_focus()
