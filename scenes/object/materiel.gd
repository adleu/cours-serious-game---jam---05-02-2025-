extends Node2D


const IMAGE_FOLDER_PATH = "res://assets/sprites/assset_Etagere/"

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
var random_key

func _ready():
	pass

func _on_button_pressed() -> void:
	print(random_key)

func setTexture(obj) -> void:
	random_key = obj
	$Sprite2D.texture = image_dict[random_key]
	$Label.text = random_key
