extends Control

@onready var enemy_team: HBoxContainer = $VBoxContainer/EnemyTeam
@onready var player_team: HBoxContainer = $VBoxContainer/PlayerTeam
@onready var turn_timer: Timer = $TurnTimer

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
	for child in team.get_children():
		if child is VBoxContainer:
			child.toy.ready()
			if team == player_team:
				list.push_front(child)
			elif team == enemy_team:
				list.push_back(child)
				child.flip_sprite()
	return list

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
	enemy_list[0].toy.hurt(player_list[0].toy.atk)
	player_list[0].toy.hurt(enemy_list[0].toy.atk)
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
