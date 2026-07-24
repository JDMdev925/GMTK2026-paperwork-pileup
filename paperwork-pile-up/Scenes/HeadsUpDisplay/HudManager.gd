extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_staple_button_pressed() -> void:
	$"../PaperGenerator".get_child(0).AddStaple()

func _on_file_paper_button_pressed() -> void:
	$"../PaperGenerator".get_child(0).FilePaper()

func _on_shred_paper_button_pressed() -> void:
	$"../PaperGenerator".get_child(0).ShredPaper()

func _on_signature_button_pressed() -> void:
	$"../PaperGenerator".get_child(0).AddSignature()

func _on_stamp_button_pressed() -> void:
	$"../PaperGenerator".get_child(0).AddStamp()
