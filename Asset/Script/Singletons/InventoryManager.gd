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
		create_weapons()
	set_initial_weapons()
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

func create_weapons():
	var weaponsData = File.new()
	for i in range(10):
		var s = sword.instance()
		s.create_random_sword()
		WeaponList.push_back(s)
	if !WeaponList.empty():
		weaponsData.open("res://Asset/Data/WeaponData.txt",File.WRITE)
		if weaponsData.is_open():
			for i in range(WeaponList.size()):
				#wName, wTexture, wSub, wDamage, wASpeed, wCritic, wRarity
				var wName = WeaponList[i].get_item_name()
				var wText = WeaponList[i].get_item_texture()
				var wSub = WeaponList[i].get_weapon_subtype()
				var wDmg = WeaponList[i].get_item_ap()
				var wAS = WeaponList[i].get_item_as()
				var wCtr= WeaponList[i].get_item_critic()
				var wRar = WeaponList[i].get_item_rarity()
				var wOwned = WeaponList[i].get_owned()
				var wEquiped = WeaponList[i].get_equiped()
				WeaponDic[i] = [wName,wText,wSub,wDmg,wAS,wCtr,wRar,wOwned,wEquiped]
			weaponsData.store_line(to_json(WeaponDic))
		weaponsData.close()
	pass

func create_armor():
	pass

func set_initial_weapons():
	WeaponList[0].set_owned(true)
	WeaponList[1].set_owned(true)
	WeaponList[0].set_equiped(true)
	WeaponList[1].set_equiped(true)
	for i in WeaponList:
		if i.get_equiped():
			WeaponEquiped.push_back(i)
	pass

func create_items():
	pass