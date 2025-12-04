extends Control

@onready var enemy_team: HBoxContainer = $VBoxContainer/EnemyTeam
#@onready var player_team: HBoxContainer = $VBoxContainer/PlayerTeam
@onready var player_team: ReverseHBoxContainer = $VBoxContainer/PlayerTeam
@onready var turn_timer: Timer = $TurnTimer
const UI_PET = preload("uid://bcx5wbef18ma4")

var player_list:Array
var enemy_list:Array

#signal attack


func _ready() -> void:
	print("ready")
	player_list = fill_list(player_team)
	enemy_list = fill_list(enemy_team)
	start_battle()

func fill_list(team) -> Array:
	var list:Array
	for child:Node in team.get_children():
		#if child is VBoxContainer:
		if child.is_in_group("Toy"):
			connect_signals(child)
			child.toy.ready()
			list.push_back(child)
			if team == enemy_team:
				child.spriteNode.flip_h = true
	return list

func connect_signals(pet)->void:
	#pet.toy.connect("attacked",_on_toy_attack)
	#pet.toy.connect("fainted",_on_toy_fainted)
	if pet.toy.ability.has_signal("summon"):
		pet.toy.ability.connect("summon",_on_summon)
		printerr(pet.toy.name,": Señal summon conectada")

func _on_summon(pet,summoner_index)->void:
	var summon = UI_PET.instantiate()
	player_list.insert(summoner_index,summon)
	player_team.add_child(summon,true)
	player_team.move_child(summon,summoner_index)
	summon.toy = pet
	summon._ready()


func start_battle():
	print("Battle starts")
	print(player_list[0].toy.current_hp)
	print(enemy_list[0].toy.current_hp)
	turn_timer.start()
	#while player_list.size() > 0 and enemy_list.size() > 0:
		#if turn_timer.is_stopped():
			#print(str("Player count: ",player_list.size()," Enemy count: ",enemy_list.size()))
			#turn_timer.start()
			#print("Timer iniciado")
		#resolve_turn()
	#if player_list.size() > enemy_list.size():
		#print("Player wins")
	#else: print("Player looses")

func resolve_turn()-> void:
	#var turno = 0
	#while player_list[0].toy.current_hp > 0 and enemy_list[0].toy.current_hp > 0:
		#turno +=1
		#print(turno)
		#enemy_list[0].toy.hurt(player_list[0].toy.atk)
		#player_list[0].toy.hurt(enemy_list[0].toy.atk)
	if player_list.size() > 0 and enemy_list.size() > 0:
		turn_timer.start()
	elif player_list.size() > enemy_list.size():
		print("Player wins")
	else: print("Player looses")
	#if enemy_list[0].toy.current_hp <=0:
		#enemy_list.pop_at(0).queue_free()
		#print("enemigo fuera de lista")
	#if player_list[0].toy.current_hp <= 0:
		#player_list[0].pop_at(0).queue_free()
		#print("jugador fuera de lista")

func _on_turn_timer_timeout() -> void:
	print()
	print(player_list[0].toy.name," attacks!")
	enemy_list[0].toy.hurt(enemy_list[0],player_list[0].toy.atk)
	print(enemy_list[0].toy.name," attacks!")
	player_list[0].toy.hurt(player_list[0],enemy_list[0].toy.atk)
	if enemy_list[0].toy.current_hp <=0:
		enemy_list.pop_at(0).queue_free()
		print("enemigo fuera de lista")
	if player_list[0].toy.current_hp <= 0:
		player_list.pop_at(0).queue_free()
		print("jugador fuera de lista")
	resolve_turn()

	#Summon
	#var pos=4
	#add_pet(load("res://sprites/turnicon.png"),5,false)
	#player_team.move_child(player_team.get_child(1),pos+1)
	#player_team.get_child(pos).queue_free()
	
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
