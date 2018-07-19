extends Node

var gold = 999999
var enemiesKilled = 0
var level = 1
var pointToSpend = 0
var wall = null
var wallLife
var wallMaxLife
var wallLevel
var player = null
var cantCompanion

func _ready():
	pass

func repair_wall(cost, repairPoints):
	if wallLife < wallMaxLife:
		gold -= cost
		wallLife += repairPoints
		if wallLife > wallMaxLife:
			wallLife = wallMaxLife
	pass

func upgrade_wall(cost):
	gold -= cost
	wallLevel += 1
	pass

func end_level():
	wallLife = wall.life
	wallMaxLife = wall.maxLife
	wallLevel = wall.level
	get_tree().change_scene("res://Asset/Scenes/UpgradeScene.tscn")
	pass