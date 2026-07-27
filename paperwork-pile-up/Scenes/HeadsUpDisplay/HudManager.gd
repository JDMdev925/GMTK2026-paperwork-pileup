extends Control

var time_remaining : float = 0

func _ready() -> void:
	time_remaining = MainManager.total_time
	
	$"Staple Button".mouse_entered.connect(_on_button_hover)
	$"Signature Button".mouse_entered.connect(_on_button_hover)
	$"Stamp Button".mouse_entered.connect(_on_button_hover)
	$"File Paper Button".mouse_entered.connect(_on_button_hover)
	$"Shred Paper Button".mouse_entered.connect(_on_button_hover)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_remaining -= delta
	$Label.text = "%.1f" % time_remaining
	if time_remaining <= 0:
		MainManager.EndGame(false)

func _on_staple_button_pressed() -> void:
	$"../PaperGenerator".get_child(0).AddStaple()
	MainManager.CursorClick()
	

func _on_file_paper_button_pressed() -> void:
	$"../PaperGenerator".get_child(0).FilePaper()
	MainManager.CursorClick()

func _on_shred_paper_button_pressed() -> void:
	$"../PaperGenerator".get_child(0).ShredPaper()
	MainManager.CursorClick()

func _on_signature_button_pressed() -> void:
	$"../PaperGenerator".get_child(0).AddSignature()
	MainManager.CursorClick()

func _on_stamp_button_pressed() -> void:
	$"../PaperGenerator".get_child(0).AddStamp()
	MainManager.CursorClick()

func _on_button_hover() -> void:
	AudioController.PlaySFX(AudioController.SFX.HOVER)
