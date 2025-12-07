extends Control

@onready var enemy_team: HBoxContainer = $VBoxContainer/EnemyTeam
@onready var player_team: ReverseHBoxContainer = $VBoxContainer/PlayerTeam
@onready var turn_timer: Timer = $TurnTimer
const UI_PET = preload("uid://bcx5wbef18ma4")

var player_list:Array
var enemy_list:Array
var battle_start_list:Array

signal toy_hurted(team,index)
#signal attack


func _ready() -> void:
	print("ready")
	player_list = fill_list(player_team)
	enemy_list = fill_list(enemy_team)
	start_battle()

func fill_list(team) -> Array:
	var list:Array
	for child:Node in team.get_children():
		if child.is_in_group("Toy"):
			if child.toy.ability.trigger == ToyAbility.TriggerList.BattleStarted:
				battle_start_list.push_back(child)
			connect_signals(child)
			child.toy.ready()
			list.push_back(child)
			if team == enemy_team:
				child.spriteNode.flip_h = true
	return list

func connect_signals(pet)->void:
	#pet.toy.connect("attacked",_on_toy_attack)
	pet.toy.connect("hurted",_on_toy_hurted)
	#if pet.toy.has_signal("fainted"):
	pet.toy.connect("fainted",_on_toy_fainted)
	
	if pet.toy.ability:
		if pet.toy.ability.has_signal("summon"):
			pet.toy.ability.connect("summon",_on_summon)
			#print(pet.toy.name,": Señal summon conectada")
		if pet.toy.ability.has_signal("damage"):
			pet.toy.ability.connect("damage",_on_damage_ability)
		
		if pet.toy.ability.trigger == ToyAbility.TriggerList.FriendAheadHurted:
			var target = pet.toy.ability
			connect("toy_hurted", Callable(target, "_on_toy_hurted"))
	

func _on_battle_start()->void:
	battle_start_list.sort_custom(func(a, b):
		if a.toy.atk != b.toy.atk:
			return a.toy.atk > b.toy.atk
		# Desempate 1: index dentro de su padre
		if a.get_index() != b.get_index():
			return a.get_index() > b.get_index()  # mayor index primero
		# Desempate 2: prioridad por equipo
		return a.get_parent().name == "player_team"
	)
	for node:Node in battle_start_list:
		node.toy.ability.effect()
		#print(node.toy.name,node.toy.atk,node.get_parent().name)


func _on_summon(pet,summoner_team,summoner_index)->void:
	var team = summoner_team
	var list = player_list
	var summon = UI_PET.instantiate()
	if team == enemy_team:
		list = enemy_list
	list.insert(summoner_index,summon)
	team.add_child(summon,true)
	team.move_child(summon,summoner_index)
	summon.toy = pet
	summon._ready()
	connect_signals(summon)


func start_battle():
	print("Battle starts")
	_on_battle_start()
	print(player_list[0].toy.current_hp)
	print(enemy_list[0].toy.current_hp)
	turn_timer.start()


func turn_resolution()-> void:
	if player_list.size() > 0 and enemy_list.size() > 0:
		turn_timer.start()
	else:
		if player_list.size() > enemy_list.size():
			print("WIN")
		elif player_list.size() < enemy_list.size():
			print("LOSS")
		else: print("DRAW")


func _on_turn_timer_timeout() -> void:
	print()
	var player_name = player_list[0].toy.name
	var player_atk = player_list[0].toy.atk
	var enemy_name = enemy_list[0].toy.name
	var enemy_atk = enemy_list[0].toy.atk
	print(player_name," attacks!")
	enemy_list[0].toy.hurt(player_atk)
	print(enemy_name," attacks!")
	player_list[0].toy.hurt(enemy_atk)
	turn_resolution()

func _on_toy_hurted(toy_node:Node)->void:
	toy_hurted.emit(toy_node.get_parent(),toy_node.get_index())

func _on_toy_fainted(toy_node)->void:
	player_list.erase(toy_node)
	enemy_list.erase(toy_node)
	toy_node.queue_free()
	#if enemy_list[0].toy.current_hp <=0:
		#enemy_list.pop_at(0).queue_free()
		#print("enemigo fuera de lista")
	#if player_list[0].toy.current_hp <= 0:
		#player_list.pop_at(0).queue_free()
		#print("jugador fuera de lista")


func _on_damage_ability(value:int,objective_team:Node,objective_index) -> void:
	if !objective_index:
		objective_index = randi_range(1,objective_team.get_child_count()-1)
	objective_team.get_children()[objective_index].toy.hurt(value)
