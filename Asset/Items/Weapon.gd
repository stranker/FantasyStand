extends "res://Asset/Items/Item.gd"

enum RARITY {NORMAL, MEDIUM, RARE, EPIC, LEGENDARY}

var attacking = false
var weaponRef = null
var weaponScene = preload("res://Asset/Items/Weapon.tscn")
var subtype = ""
var damage
var attackSpeed
var critic
var rarity

func create_weapon(wName, wTexture, wDamage, wASpeed, wCritic, wRarity, wOwned, wEquiped):
	set_item_name(wName)
	set_item_texture(wTexture)
	set_item_type("Weapon")
	set_owned(wOwned)
	set_equiped(wEquiped)
	damage = wDamage
	attackSpeed = wASpeed
	critic = wCritic
	rarity = wRarity

func get_item_ap():
	return damage

func get_item_as():
	return attackSpeed

func get_item_critic():
	return critic

func get_item_rarity():
	return rarity

func get_weapon_subtype():
	return subtype

func set_weapon_subtype(subt):
	subtype = subt

func attack():
	pass

func set_attacking(val):
	attacking = val

func update_stats(strength, agility, luck):
	pass
