extends Node2D

enum RARITY {NORMAL, MEDIUM, RARE, EPIC, LEGENDARY}

var damage
var attackSpeed
var critic
var rarity
var weaponName
var attacking = false

 

func attack():
	pass

func set_attacking(val):
	attacking = val

func update_stats(strength, agility, luck):
	pass

func create_weapon(wName,wDamage,wASpeed,wCritic,wRarity):
	weaponName = wName
	damage = wDamage
	attackSpeed = wASpeed
	critic = wCritic
	rarity = wRarity
	pass