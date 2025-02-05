extends Node2D

@onready
var exm1 = $"mark/exclamation"
@onready
var exm2 = $"mark/exclamation2"
@onready
var exm3 = $"mark/exclamation3"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.increment_event()
	GameManager.increment_event()
	exm2.change_Alpha(0.5)
	exm3.change_Alpha(0.5)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_acceuil_pressed() -> void:
	$Acceuil.visible = true
	exm1.change_Alpha(0.5)
	exm2.change_Alpha(1)
	_clear_main_view()
	
func _on_button_etagere_pressed() -> void:
	$"Etagère".visible = true
	$"Etagère"._initialiser()
	exm1.change_Alpha(1)
	exm2.change_Alpha(0.5)
	_clear_main_view()

func _on_button_commentaire_pressed() -> void:
	$Commentaire.visible = true
	pass

func _clear_main_view() -> void:
	#$Bg1.visible = false
	pass
	
