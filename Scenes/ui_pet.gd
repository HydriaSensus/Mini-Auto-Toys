extends Button

@export var toy:ToyStats
#@export var item:Item

@onready var spriteNode: Sprite2D = $VBContainer/SpriteContainer/Sprite
@onready var atk_label: Label = $VBContainer/Stats/AtkTexture/AtkLabel
@onready var hp_label: Label = $VBContainer/Stats/HPTexture/HPLabel
@onready var level_label: Label = $VBContainer/Top/Level/LevelLabel
@onready var xp_bar: ProgressBar = $VBContainer/XPBar
@onready var item_texture: TextureRect = $VBContainer/Top/ItemTexture

func _ready() -> void:
	if toy:
		spriteNode.texture = toy.sprite
		spriteNode.flip_h = toy.is_enemy
		atk_label.text = str(toy.atk)
		hp_label.text = str(toy.hp)
		level_label.text = str(toy.level)
		xp_bar.value = toy.xp
	#	item_texture.texture =  item.sprite
