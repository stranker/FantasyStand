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
		if data.length() > 1:
			WeaponDic = parse_json(data)
			
	weaponsData.close()
	return loaded

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
				#wName, wTexture, wDamage, wASpeed, wCritic, wRarity
				var wName = WeaponList[i].get_item_name()
				var wText = WeaponList[i].get_item_texture()
				var wDmg = WeaponList[i].get_item_ap()
				var wAS = WeaponList[i].get_item_as()
				var wCtr= WeaponList[i].get_item_critic()
				var wRar = WeaponList[i].get_item_rarity()
				var wOwned = WeaponList[i].get_owned()
				var wEquiped = WeaponList[i].get_equiped()
				WeaponDic[i] = [wName,wText,wDmg,wAS,wCtr,wRar,wOwned,wEquiped]
			weaponsData.store_line(to_json(WeaponDic))
		weaponsData.close()
	pass

func create_armor():
	pass

func create_items():
	pass