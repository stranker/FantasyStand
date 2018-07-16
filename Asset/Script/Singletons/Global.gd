extends Node

var gold = 0
var enemiesKilled = 0
var level = 1
var pointToSpend = 0
var wall = null
var wallLife
var wallMaxLife
var wallLevel
var player = null

func _ready():
	if !wall:
		wallLife = 55
		wallMaxLife = 230
		wallLevel = 2
	pass

func end_level():
	wallLife = wall.life
	wallMaxLife = wall.maxLife
	get_tree().change_scene("res://Asset/Scenes/UpgradeScene.tscn")
	pass