extends Control

var plaqueArray = ["25-X85-77","M5-TRC-LS"]
var plaqueInfoArray = ["huile moteur : ref <zorblux>"]

@onready
var plaqueString = $step_1/TextEdit
@onready
var step2Label = $step_2/Label

var text_empty = true
@onready
var invalide = $step_1/Label2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$step_1.visible = true
	$step_2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_2_pressed() -> void:
	visible = false


#ok
func _on_button_pressed() -> void:
	if plaqueString.text != null:
		var indice = plaqueArray.find(plaqueString.text.strip_edges().to_upper())
		if indice != -1:
			$step_1.visible = false
			$step_2.visible = true
			$step_2/Label.text = plaqueInfoArray[indice]
		else :
			invalide.visible = true
