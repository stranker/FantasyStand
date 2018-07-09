extends Node2D

enum RARITY {NORMAL, MEDIUM, RARE, EPIC, LEGENDARY}

var damage
var level
var rarity
var weaponName
var attacking = false

func attack():
	pass

func set_attacking(val):
	attacking = val