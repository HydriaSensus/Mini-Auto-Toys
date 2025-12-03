extends VBoxContainer

@export var toy:ToyStats
#@export var item:Item

@onready var spriteNode: Sprite2D = $SpriteContainer/Sprite
@onready var atk_label: Label = $Bottom/Atk/AtkLabel
@onready var hp_label: Label = $Bottom/HP/HPLabel
@onready var level_label: Label = $Top/Level/LevelLabel
@onready var xp_bar: ProgressBar = $XPBar
@onready var item_sprite: TextureRect = $Top/Item


func _ready() -> void:
	if toy:
		spriteNode.texture = toy.sprite
		atk_label.text = str(toy.atk)
		hp_label.text = str(toy.hp)
		level_label.text = str(toy.level)
		xp_bar.value = toy.xp
	#	item_sprite.texture =  item.sprite

func flip_sprite()->void:
		spriteNode.flip_h =!spriteNode.flip_h


#func _process(_delta: float) -> void:
	#if sprite == null:
		#self.visible = false
	#else:
		#self.visible = true
