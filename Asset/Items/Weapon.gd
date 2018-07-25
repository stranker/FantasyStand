extends "res://Asset/Items/Item.gd"

enum RARITY {NORMAL, MEDIUM, RARE, EPIC, LEGENDARY}

var attacking = false
var weaponRef = null
var weaponScene = preload("res://Asset/Items/Weapon.tscn")
var damage
var attackSpeed
var critic
var rarity

func create_weapon(wName, wTexture, wDamage, wASpeed, wCritic, wRarity):
	set_item_name(wName)
	set_item_texture(wTexture)
	set_item_type("Weapon")
	damage = wDamage
	attackSpeed = wASpeed
	critic = wCritic
	rarity = wRarity
	create_reference()

func get_item_ap():
	return damage

func get_item_as():
	return attackSpeed

func attack():
	pass

func set_attacking(val):
	attacking = val

func update_stats(strength, agility, luck):
	pass

func create_reference():
	weaponRef = weaponScene.instance()
	weaponRef.set_item_name(get_item_name())
	weaponRef.set_item_texture(get_item_texture())
	weaponRef.set_item_type(get_item_type())
	weaponRef.damage = damage
	weaponRef.attackSpeed = attackSpeed
	weaponRef.critic = critic
	weaponRef.rarity = rarity
	Global.items.add_weapon(weaponRef)
	pass
