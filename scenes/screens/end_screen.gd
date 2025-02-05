extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var score = GameManager.reputation
	if(score < 0):
		$CenterContainer/VBoxContainer/Label2.text = "Vous êtes viré !"
	elif(score < 10):
		$CenterContainer/VBoxContainer/Label2.text = "Bien joué, mais vous pouvez mieux faire"
	else :
		$CenterContainer/VBoxContainer/Label2.text = "Vous êtes Exemplaire !"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	pass # Replace with function body.
