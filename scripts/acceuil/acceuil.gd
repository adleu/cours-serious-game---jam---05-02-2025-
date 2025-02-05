extends Node2D

@onready
var dialog = $TextBox

@onready
var button_donner = $Button3

var text_finished = false
var timer_before_next_event = -1

var triggered = [false, false, false, false]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer_before_next_event != -1 && timer_before_next_event > 0 :
		timer_before_next_event =- delta
	if timer_before_next_event <= 0 &&  timer_before_next_event != -1:
		GameManager.increment_event()
		timer_before_next_event = -1
		
	for i in triggered.size():
		if !triggered[i] && GameManager.current_event == i:
			_trigger_event(i)
			
	if button_donner != null:
		if GameManager.current_object != "" && button_donner.visible == false:
			button_donner.visible = true
			button_donner.text = "Donner [" +GameManager.current_object +"]"
	
func _trigger_event(indice):
	triggered[indice] = true
	print(indice)
	match indice:
		1: 
			hide_pnj()
			$Container/PNJ_1.visible = true
			dialog.display_text(GameManager.characDialog[indice])
			text_finished = false
		2: 
			hide_pnj()
			$Container/PNJ_2.visible = true
			dialog.display_text(GameManager.characDialog[indice])
			text_finished = false
		3: 
			print("event 3")
			hide_pnj()
			$Container/PNJ_3.visible = true
			dialog.display_text(GameManager.characDialog[indice])
			text_finished = false


func _on_button_pressed() -> void:
	$InterfacePc.visible = true


func _on_button_2_pressed() -> void:
	visible = false
	
func hide_pnj():
	$Container/PNJ_1.visible = false
	$Container/PNJ_2.visible = false
	$Container/PNJ_3.visible = false
	
func _on_button_3_pressed() -> void:
	if(text_finished):
		if GameManager.current_object == GameManager.object_objectif[GameManager.current_event]:
			dialog.display_text("merci ! à la revoyure")
			text_finished = false
			timer_before_next_event = 10
			GameManager.updateReputation(GameManager.reputation + 5)
		else:
			dialog.display_text("Ce n'est pas le bon bing chilling")
			text_finished = false
			GameManager.updateReputation(GameManager.reputation - 10)
			
	print((GameManager.reputation))
			


func _on_text_box_finished_displaying() -> void:
	text_finished = true
