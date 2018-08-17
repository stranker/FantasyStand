extends Node

var gold
var enemiesKilled
var level
var pointToSpend
var cantCompanion
var wall = null
var player = null

var current_scene = null

var gameOverScene = "res://Asset/Scenes/GameOverScene.tscn"
var gameScene = "res://Asset/Scenes/TestScene.tscn"
var upgradeScene = "res://Asset/Scenes/UpgradeScene.tscn"

class Wall:
	var life = 100
	var maxLife = 100
	var level = 1
	
	func repair_wall(cost, repairPoints):
		if life < maxLife:
			Global.gold -= cost
			life += repairPoints
			if life > maxLife:
				life = maxLife

	func upgrade_wall(cost):
		Global.gold -= cost
		level += 1
		maxLife += 50
		life = maxLife
	
	func initialize():
		maxLife = 100
		life = maxLife
		level = 1

class Player:
	var strength = 1
	var agility = 1
	var intelligence = 1
	var luck = 1
	var speed = 100
	var playerRef = null
	
	func initialize():
		speed = 100
		strength = 1
		agility = 1
		intelligence = 1
		luck = 1
	
	func add_stats(stre,agi,intel,lck):
		strength += stre
		agility += agi
		intelligence += intel
		luck += lck

func _ready():
	initialize()
	pass

func new_game():
	wall.initialize()
	player.initialize()
	gold = 9999
	pointToSpend = 0
	enemiesKilled = 0
	level = 1
	pass

func initialize():
	wall = Wall.new()
	player = Player.new()
	gold = 9999
	pointToSpend = 0
	enemiesKilled = 0
	level = 1
	var root = get_tree().root
	current_scene = root.get_child( root.get_child_count() -1 )
	pass


func goto_scene(path):
	call_deferred("_deferred_goto_scene",path)
	pass

func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().root.add_child(current_scene)
	get_tree().set_current_scene( current_scene )

func end_level():
	pointToSpend += 1
	player.playerRef.retreive_weapons()
	goto_scene(upgradeScene)
	pass

func next_level():
	level += 1
	InventoryManager.set_equiped_weapons()
	goto_scene(gameScene)
	pass

func game_over():
	goto_scene(gameOverScene)
	get_tree().change_scene(gameOverScene)
	new_game()
	pass