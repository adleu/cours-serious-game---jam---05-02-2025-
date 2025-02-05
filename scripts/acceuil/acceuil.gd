extends Node2D

@onready
var dialog = $TextBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	dialog.display_text("dfnfjsdfrgskbgjgsbbgbgsvbgjkfg")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	$InterfacePc.visible = true


func _on_button_2_pressed() -> void:
	visible = false
