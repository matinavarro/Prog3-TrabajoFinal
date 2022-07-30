extends Control
onready var soundButton = $SoundButton
onready var musicGame = $musica

func _ready():
	$VBoxContainer/StartButton.grab_focus()#grab_focus funciona para poder utilizar el teclado para eleccion de botones
	
func _process(delta):
	if Global.music:
		musicGame.stream_paused = false #uso esta propiedad para reanudar la musica donde quedo
	elif !Global.music:
		musicGame.stream_paused = true

func _on_StartButton_pressed():#realizamos cambio de escena hacia level1
	if Global.fx:
		soundButton.play()
	get_tree().change_scene("res://scenes/loadingScene.tscn")

func _on_OptionButton_pressed():#ingresamos a opciones
	if Global.fx:
		soundButton.play()
	$opciones.visible = true
	$VBoxContainer.visible = false
	
func _on_QuitButton_pressed():#salimos del juego
	if Global.fx:
		soundButton.play()
	get_tree().quit()

func _on_music_pressed():
	if Global.fx:
		soundButton.play()
	Global.music = !Global.music
	if Global.music:
		$opciones/music.text = "on"
	else:
		$opciones/music.text = "off"

func _on_fx_pressed():
	if Global.fx:
		soundButton.play()
	Global.fx = !Global.fx
	if Global.fx:
		$opciones/fx.text = "on"
	else:
		$opciones/fx.text = "off"

func _on_volver_pressed():
	if Global.fx:
		soundButton.play()
	$opciones.visible = false
	$Objetivo.visible = false
	$VBoxContainer.visible = true

func _on_Obj_pressed():
	if Global.fx:
		soundButton.play()
	$Objetivo.visible = true
	$VBoxContainer.visible = false
	pass # Replace with function body.
