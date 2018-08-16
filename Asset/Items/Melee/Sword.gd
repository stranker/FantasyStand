extends "res://Asset/Items/Melee/Melee.gd"

func _ready():
	pass

func attack():
	if !attacking:
		attacking = true
		$Anim.play("Attack",-1, attackSpeed)
	pass

func _on_Sword_body_entered(body):
	if body.is_in_group("Enemy") and attacking:
		body.get_damage(damage)
	pass # replace with function body

func update_stats(strength, agility, luck):
	damage += strength / 2
	pass

func create_random_sword():
	#wName,wText,wSub,wDmg,wASpeed,wCritic,wRarity,wOwned,wEquiped
	var wName = "Random Weapon"
	var wText = "res://icon.png"
	var wDmg = rand_range(1,10)
	var wASpeed = rand_range(1.0,10.0)
	var wCritic = rand_range(1,10)
	var wRarity = 0
	var wOwned = false
	var wEquiped = false
	var wSub = "Melee"
	create_weapon(wName,wText,wSub,wDmg,wASpeed,wCritic,wRarity,wOwned,wEquiped)
	pass

func create_initial_sword():
	var wName = "Training sword"
	var wText = "res://icon.png"
	var wDmg = 1
	var wASpeed = 1
	var wCritic = 1
	var wRarity = RARITY.NORMAL
	var wOwned = true
	var wEquiped = true
	var wSub = "Melee"
	create_weapon(wName,wText,wSub,wDmg,wASpeed,wCritic,wRarity,wOwned,wEquiped)
	pass