extends "res://Asset/Weapons/Weapon.gd"


func _ready():
	create_weapon("test",1,1,NORMAL)
	pass

func attack():
	if !attacking:
		attacking = true
		var attackSpeed = Global.player.agility / 5
		if attackSpeed < 1:
			attackSpeed = 1
		$Anim.play("Attack",-1, attackSpeed)
	pass

func _on_Sword_body_entered(body):
	if body.is_in_group("Enemy") and attacking:
		body.get_damage(damage)
	pass # replace with function body

func update_stats(strength, agility, luck):
	damage += strength / 2
	pass