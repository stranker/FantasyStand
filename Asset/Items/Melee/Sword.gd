extends "res://Asset/Items/Melee/Melee.gd"

func _ready():
	#create_weapon("Sword","res://icon.png", 1, 2, 1, NORMAL)
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
	#wName, wTexture, wDamage, wASpeed, wCritic, wRarity
	var wName = "Random Weapon"
	var wText = "res://icon.png"
	var wDmg = rand_range(1,10)
	var wASpeed = rand_range(1.0,10.0)
	var wCritic = rand_range(1,10)
	var wRarity = 0
	create_weapon(wName,wText,wDmg,wASpeed,wCritic,wRarity)
	pass