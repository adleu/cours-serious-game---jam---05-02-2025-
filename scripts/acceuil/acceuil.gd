extends Node2D

@onready
var dialog = $TextBox

var triggered = [false, false, false, false]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in triggered.size():
		if !triggered[i] && GameManager.current_event == i:
			_trigger_event(i)
	
func _trigger_event(indice):
	triggered[indice] = true
	print(indice)
	match indice:
		1: 
			hide_pnj()
			$Container/PNJ_1.visible = true
			dialog.display_text(GameManager.characDialog[indice])
		2: 
			hide_pnj()
			$Container/PNJ_2.visible = true
			dialog.display_text(GameManager.characDialog[indice])
		2: 
			hide_pnj()
			$Container/PNJ_3.visible = true
			dialog.display_text(GameManager.characDialog[indice])
	print(GameManager.plaqueInfoArray[indice].split("ref : ")[1])

	

func _on_button_pressed() -> void:
	$InterfacePc.visible = true


func _on_button_2_pressed() -> void:
	visible = false
	
func hide_pnj():
	$Container/PNJ_1.visible = false
	$Container/PNJ_1.visible = false
	$Container/PNJ_1.visible = false


	
	
