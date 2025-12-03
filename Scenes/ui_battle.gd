extends Control

@onready var enemy_team: HBoxContainer = $VBoxContainer/EnemyTeam
@onready var player_team: HBoxContainer = $VBoxContainer/PlayerTeam
const UI_PET = preload("uid://bcx5wbef18ma4")
const SOLDIER = preload("uid://dx70tur8hxbfg")

var new_instance = UI_PET.instantiate()

 #Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#
	#for i in range(5):
		#add_pet(load("res://sprites/turnicon.png"),i,false)
		#add_pet(SOLDIER,i,true)
	#
	##Summon
	##var pos=4
	##add_pet(load("res://sprites/turnicon.png"),5,false)
	##player_team.move_child(player_team.get_child(1),pos+1)
	##player_team.get_child(pos).queue_free()
	#
#func add_pet(sprite,level,isEnemy):
	#new_instance = UI_PET.instantiate()
	#new_instance.sprite = sprite
	#new_instance.level=level+1
	#if isEnemy:
		#new_instance.enemy = true
		#enemy_team.add_child(new_instance,true)
	#else:
		#player_team.add_child(new_instance,true)
		#player_team.move_child(new_instance,1)
