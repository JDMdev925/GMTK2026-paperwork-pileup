extends Control

func _on_button_pressed() -> void:
	AudioController.PlaySFX(AudioController.SFX.CLICK)
	MainManager.NewGame(9, 90)


func _on_button_mouse_entered() -> void:
	AudioController.PlaySFX(AudioController.SFX.HOVER)
