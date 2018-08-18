extends KinematicBody2D

enum STATES {WALKING,RUNNING,ATTACKING,KNOCKED, FOLLOW}
export (int) var speed
var velocity = Vector2()
export (int) var life
var currentState
var wall = null
export (int) var damage
export (int) var gold

func create_enemy(_speed, _life, _damage, _gold):
	speed = _speed
	life = _life
	damage = _damage
	gold = _gold
	currentState = STATES.WALKING
	pass

func _ready():
	add_to_group("Enemy")
	pass

func _process(delta):
	if !Global.wallStats.life > 0:
		currentState = STATES.FOLLOW
	pass

func get_damage(val):
	pass

func attack_wall():
	pass