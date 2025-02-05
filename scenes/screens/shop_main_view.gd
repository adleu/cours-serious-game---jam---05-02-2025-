extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_pressed() -> void:
	$Acceuil.visible = true
	$Bg1.visible = false
	
	for child in $mark.get_children():
		child.visible = false
	
	for child in $bouton.get_children():
		child.visible = false
