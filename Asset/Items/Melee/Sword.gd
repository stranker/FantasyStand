extends "res://Asset/Items/Weapon.gd"

func _ready():
	create_weapon("Sword","res://icon.png", 1,2,1,NORMAL,"Melee")
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