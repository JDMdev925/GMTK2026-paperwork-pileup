extends Node

var SfxInstance : AudioStreamPlayer

var sfx_hover : Resource
var sfx_click : Resource

enum SFX{
	HOVER,
	CLICK
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InstanceSFXPlayer()
	sfx_hover = load("res://Scenes/HeadsUpDisplay/HUD assets/HUD audio/click_003.ogg")
	sfx_click = load("res://Scenes/HeadsUpDisplay/HUD assets/HUD audio/click_002.ogg")

func InstanceSFXPlayer() -> void:
	SfxInstance = AudioStreamPlayer.new()
	add_child(SfxInstance)
	SfxInstance.bus = "Master"
	SfxInstance.max_polyphony = 1

func PlaySFX(sfx : SFX) -> void:
	
	match(sfx):
		SFX.HOVER:
			SfxInstance.stream = sfx_hover
		SFX.CLICK:
			SfxInstance.stream = sfx_click
		_:
			SfxInstance.stream = sfx_hover
	
	SfxInstance.play()
