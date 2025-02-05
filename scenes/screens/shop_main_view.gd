extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.increment_event()
	GameManager.increment_event()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_acceuil_pressed() -> void:
	$Acceuil.visible = true
	_clear_main_view()
	
func _on_button_etagere_pressed() -> void:
	$"Etagère".visible = true
	$"Etagère"._initialiser()
	_clear_main_view()

func _on_button_commentaire_pressed() -> void:
	pass

func _clear_main_view() -> void:
	#$Bg1.visible = false
	pass
	
