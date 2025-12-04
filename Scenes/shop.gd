extends Control
@onready var buy_pet: Button = $VBoxContainer/Shop/BuyPet


func _ready() -> void:
	buy_pet.grab_focus()
