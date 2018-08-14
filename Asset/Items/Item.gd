extends Node

var itemName = ""
var itemTexture = ""
var itemType = ""
var owned = false
var equiped = false

func set_item_name(val):
	itemName = val

func set_item_texture(val):
	itemTexture = val

func set_item_type(val):
	itemType = val

func get_item_name():
	return itemName

func get_item_texture():
	return itemTexture

func get_item_type():
	return itemType

func get_owned():
	return owned

func set_owned(val):
	owned = val

func set_equiped(val):
	equiped = val

func get_equiped():
	return equiped