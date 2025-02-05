extends Sprite2D

var jeff = {
	"avis": load("res://avis_jeff.png"),
	"bonne_reponse": "Merci pour votre retour positif ! Nous sommes ravis d'apprendre que vous avez apprécié notre service. Votre satisfaction est notre priorité. N'hésitez pas à revenir chez Norauto pour tous vos besoins automobiles. À bientôt !",
	"mauvaise_reponse": "Bonjour, nous avons beaucoup de clients donc votre avis n'est pas valable.",
}

var kevin = {
	"avis": load("res://avis_kevin.png"),
	"bonne_reponse": "Nous sommes désolés pour cette mauvaise expérience. Votre retour est précieux et nous allons travailler à améliorer notre accueil. Merci de nous l'avoir signalé.",
	"mauvaise_reponse": "Désolé, mais nous ne pouvons pas satisfaire tout le monde.",
}

var pecci = {
	"avis": load("res://avis_pecci.png"),
	"bonne_reponse": "Merci pour votre retour positif ! Le délai de montage des pneus est généralement d'environ 30 minutes. N'hésitez pas à nous contacter pour plus d'informations.",
	"mauvaise_reponse": "Le délai dépend, revenez plus tard.",
}

# pour abdel

var avis = [jeff, kevin, pecci]
var avis_index = 0

@onready
var bonne_reponse = $Panel/Button
@onready
var mauvaise_reponse = $Panel2/Button
@onready
var submit = $Button
@onready
var particle = $CPUParticles2D

var selected_reponse = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = avis[avis_index].avis
	bonne_reponse.text = (avis[avis_index].bonne_reponse) 
	mauvaise_reponse.text = (avis[avis_index].mauvaise_reponse) 
	submit.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_button_down() -> void:
	if avis_index == 2:
		visible = false
		GameManager.game_2_finishes = true
		return 
	
	
	avis_index += 1
	texture = avis[avis_index].avis
	bonne_reponse.text = (avis[avis_index].bonne_reponse) 
	mauvaise_reponse.text = (avis[avis_index].mauvaise_reponse) 
	submit.disabled = true
	particle.emitting = true
	
	if selected_reponse == 1:
		GameManager.updateReputation(GameManager.reputation + 5)
	else:
		GameManager.updateReputation(GameManager.reputation - 10)
	
	selected_reponse = -1


func _on_first_response() -> void:
	selected_reponse = 1
	submit.disabled = false

func _on_second_response() -> void:
	selected_reponse = 2
	submit.disabled = false
