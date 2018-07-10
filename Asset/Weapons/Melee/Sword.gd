extends "res://Asset/Script/Weapon.gd"


func _ready():
	create_weapon("test",1,1,NORMAL)
	pass

func attack():
	if !attacking:
		attacking = true
		$Anim.play("Attack")
	pass

func _on_Sword_body_entered(body):
	if body.is_in_group("Enemy"):
		body.get_damage(damage)
	pass # replace with function body
