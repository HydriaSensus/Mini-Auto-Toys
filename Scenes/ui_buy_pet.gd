extends Button

@export var toy:ToyStats

@onready var sprite: Sprite2D = $VBoxContainer/SpriteContainer/Sprite
@onready var tier_texture: TextureRect = $VBoxContainer/TierTexture
@onready var atk_label: Label = $VBoxContainer/Stats/AtkTexture/AtkLabel
@onready var hp_label: Label = $VBoxContainer/Stats/HPTexture/HPLabel

const ATKOLD = preload("uid://0ib3wprlfmi6")

func _ready() -> void:
	if toy:
		sprite.texture = toy.sprite
		atk_label.text = str(toy.atk)
		hp_label.text = str(toy.hp)
		tier_texture.texture = match_tier(toy.tier)

func match_tier(tier) -> Texture:
	match tier:
		1:
			return ATKOLD
		_:
			return
