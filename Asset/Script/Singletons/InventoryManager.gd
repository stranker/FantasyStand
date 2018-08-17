extends Node

var sword = preload("res://Asset/Items/Melee/Sword.tscn")
var bow = preload("res://Asset/Items/Range/Bow.tscn")

var WeaponDic = {}
var ArmorDic = {}
var ItemsDic = {}

var WeaponList = []
var ArmorList = []
var ItemsList = []

var WeaponEquiped = []

func _ready():
	if !load_weapons():
		create_initial_weapons()
	pass

func load_weapons():
	var loaded = false
	var weaponsData = File.new()
	weaponsData.open("res://Asset/Data/WeaponData.txt",File.READ)
	if weaponsData.is_open():
		var data = weaponsData.get_line()
		if data.length() > 1:
			WeaponDic = parse_json(data)
			loaded = true
		dic_to_weapon()
	weaponsData.close()
	return loaded

func dic_to_weapon():
	for i in WeaponDic.keys():
		var s = sword.instance()
		var wName = WeaponDic[i][0]
		var wText = WeaponDic[i][1]
		var wSubt = WeaponDic[i][2]
		var wDmg = WeaponDic[i][3]
		var wAs = WeaponDic[i][4]
		var wCtr = WeaponDic[i][5]
		var wRar = WeaponDic[i][6]
		var wOwn = WeaponDic[i][7]
		var wEqu = WeaponDic[i][8]
		s.create_weapon(wName,wText,wSubt,wDmg,wAs,wCtr,wRar,wOwn,wEqu)
		WeaponList.push_back(s)
	pass

func create_initial_weapons():
	var s = sword.instance()
	var b = bow.instance()
	s.create_initial_sword()
	b.create_initial_bow()
	WeaponList.push_back(s)
	WeaponList.push_back(b)
	WeaponEquiped.push_back(s)
	WeaponEquiped.push_back(b)
	pass

func set_equiped_weapons():
	for i in WeaponList:
		if i.get_equiped():
			WeaponEquiped.push_back(i)
	pass

func create_armor():
	pass

func create_items():
	pass