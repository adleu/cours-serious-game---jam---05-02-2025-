extends Node2D

var adBlue = load("res://assets/sprites/assset_Etagere/adblue.png")
var cligno = load("res://assets/sprites/assset_Etagere/clignotant.png")
var derailleur = load("res://assets/sprites/assset_Etagere/derailleur.png")
var gearbox = load("res://assets/sprites/assset_Etagere/gearbox.png")
var essuie = load("res://assets/sprites/assset_Etagere/image_2025-02-05_112316817-removebg-preview.png")
var pneu = load("res://assets/sprites/assset_Etagere/image_2025-02-05_112809715-removebg-preview.png")
var huile = load("res://assets/sprites/assset_Etagere/pxArt_1_-removebg-preview.png")
var batterie = load("res://assets/sprites/assset_Etagere/pxArt_2_-removebg-preview.png")
var rizlac = load("res://assets/sprites/assset_Etagere/pxArt-removebg-preview.png")
var vilebrequin = load("res://assets/sprites/assset_Etagere/vilbrequin.png")

var tab_image = [adBlue,cligno,derailleur,gearbox,essuie,pneu,huile,batterie,rizlac,vilebrequin]

var random_image

var image_dict = {
	"adBlue": adBlue,
	"clignotant": cligno,
	"dérailleur": derailleur,
	"boîte de vitesse": gearbox,
	"lave glace": essuie,
	"pneu": pneu,
	"huile": huile,
	"batterie": batterie,
	"rizlac": rizlac,
	"vilebrequin": vilebrequin
}


var obj_tab = []

var goal 

func _ready() -> void:
	for child in $objet.get_children():
		var keys = image_dict.keys()
		var random_index = randi() % keys.size()
		var random_key = keys[random_index]
		var random_image = image_dict[random_key]
		obj_tab.append(random_key)
		child.setTexture(random_key)
		print(random_key)
		print(obj_tab)
	
	goal = obj_tab[randi() % obj_tab.size()]
	print("Objectif :"+goal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
