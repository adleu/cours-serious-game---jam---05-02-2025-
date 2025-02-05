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

var obj_ref = GameManager.object_objectif[GameManager.current_event+2]
var obj = GameManager.plaqueInfoArray[GameManager.current_event+2]

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
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	visible = false

func _initialiser() -> void:
	"""for child in $objet/vraiobjet.get_children():
		var keys = image_dict.keys()
		var random_index = randi() % keys.size()
		var random_key = keys[random_index]
		var random_image = image_dict[random_key]
		obj_tab.append(random_key)
		child.setTexture(obj_ref,get_image_for_description(obj))
		#print("ref :"+obj_ref)
		#print(obj)
		child.setLabel(obj_ref)"""
	var children = $objet/vraiobjet.get_children()
	var correct_child_index = randi() % children.size()

	# Obtenir l'image correspondant à la bonne référence
	var correct_image = get_image_for_description(obj)

	for index in range(children.size()):
		var child = children[index]
		if index == correct_child_index:
			# Assigner la bonne référence à cet enfant
			child.setTexture(obj_ref,correct_image)
			child.setLabel(obj_ref)
			obj_tab.append(obj_ref)
			child.visible = true
		else:
			# Générer une référence aléatoire en modifiant la vraie clé
			var random_key = generate_random_reference(obj_ref)
			var random_image = get_image_for_description(random_key)
			child.setTexture(random_key,correct_image)
			child.setLabel(random_key)
			obj_tab.append(random_key)
			child.visible = true
	
	for child in $objet/Prop.get_children():
		# Sélectionner une image aléatoire du dictionnaire
		var keys = GameManager.plaqueInfoArray
		var random_index = randi() % (keys.size() -1) + 1
		print(random_index)
		# Assigner l'image aléatoire au Sprite
		child.setTexture(GameManager.object_objectif[random_index],get_image_for_description(keys[random_index]))
		child.setLabel(GameManager.object_objectif[random_index])
		child.visible = true

func get_image_for_description(description: String) -> Texture:
	if description.contains("huile"):
		return image_dict["huile"]
	elif description.contains("batterie"):
		return image_dict["batterie"]
	elif description.contains("AD BLUE"):
		return image_dict["adBlue"]
	elif description.contains("clignotant"):
		return image_dict["clignotant"]
	elif description.contains("pneu"):
		return image_dict["pneu"]
	elif description.contains("dérailleur"):
		return image_dict["dérailleur"]
	elif description.contains("boîte de vitesse"):
		return image_dict["boîte de vitesse"]
	elif description.contains("lave glace"):
		return image_dict["lave glace"]
	elif description.contains("rizlac"):
		return image_dict["rizlac"]
	elif description.contains("vilebrequin"):
		return image_dict["vilebrequin"]
	else:
		return null

func generate_random_reference(original_key: String) -> String:
	var modified_key = original_key
	var length = modified_key.length()

	# Inverser des lettres aléatoires
	var num_swaps = randi() % (length / 2) + 1
	for i in range(num_swaps):
		var index1 = randi() % length
		var index2 = randi() % length
		var temp = modified_key[index1]
		modified_key = modified_key.substr(0, index1) + modified_key[index2] + modified_key.substr(index1 + 1)
		modified_key = modified_key.substr(0, index2) + temp + modified_key.substr(index2 + 1)

	# Ajouter des caractères aléatoires
	var num_additions = randi() % 3
	for j in range(num_additions):
		var random_char = String.chr(randi() % 26 + 97)  # Caractère aléatoire entre 'a' et 'z'
		var insert_index = randi() % (length + 1)
		modified_key = modified_key.insert(insert_index, random_char)

	return modified_key
