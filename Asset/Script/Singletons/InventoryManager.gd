extends Node

var sword = preload("res://Asset/Items/Melee/Sword.tscn")
var bow = preload("res://Asset/Items/Range/Bow.tscn")

var WeaponDic = {}
var ArmorDic = {}
var ItemsDic = {}

var WeaponList = []
var ArmorList = []
var ItemsList = []

func _ready():
	if !load_weapons():
		create_weapons()
	pass

func load_weapons():
	var loaded = false
	var weaponsData = File.new()
	weaponsData.open("res://Asset/Data/WeaponData.txt",File.READ)
	if weaponsData.is_open():
		var data = weaponsData.get_line()
		WeaponDic = parse_json(data)
	weaponsData.close()
	return loaded

func create_weapons():
	var weaponsData = File.new()
	for i in range(10):
		var s = sword.instance()
		s.create_random_sword()
		WeaponList.push_back(s)
	#weaponsData.open("res://Asset/Data/WeaponData.txt",File.WRITE)
	#if weaponsData.is_open():
	#weaponsData.close()
	print(WeaponList)
	pass

func create_armor():
	pass

func create_items():
	pass