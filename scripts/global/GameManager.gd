extends Node
var Score

var plaqueArray = ["","27-X85-77","M5-TRC-LS","89-CCA-LS","15-VBX-M5","99-bbb-77"]
var plaqueInfoArray = ["","huile moteur : ref <zorblux>","batterie ref : X78","AD BLUE", "Ampoule feu avant Norotau", "pneu été 205 55 R16" ]
var characDialog = ["","Bonjour monsieur ahahaha ! Ma plaque est la suivante : 27-X85-77 !!!","..... bonjour..... j'ai besoin de batterie.... ma plaque .....M5-TRC-LS ","fdfdsAD BLUE", "Ampoule fefdfsdfsfdsu avant Norotau", "pnefdsdfdfsu été 205 55 R16" ]

var current_event = 0

func increment_event():
	current_event+=1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
