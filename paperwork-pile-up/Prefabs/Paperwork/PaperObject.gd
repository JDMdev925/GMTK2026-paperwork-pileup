extends PaperClass

func PaperSetup() -> void:
	$AnimationPlayer.play("paper_slide_in")
	
	if staple == true:
		$"Paper Clip".color = Color.GREEN
	else:
		$"Paper Clip".color = Color.RED
	
	if stamp == true:
		$"Paper Stamp".color = Color.GREEN
	else:
		$"Paper Stamp".color = Color.RED
	
	if signature == true:
		$"Paper Signature".color = Color.GREEN
	else:
		$"Paper Signature".color = Color.RED

func AddStaple() -> void:
	if staple == false:
		staple = true
		$"Paper Clip".color = Color.GREEN
	else:
		overload += 1
		print("Overload - staple")

func AddSignature() -> void:
	if signature == false:
		signature = true
		$"Paper Signature".color = Color.GREEN
	else:
		overload += 1
		print("Overload - sign")

func AddStamp() -> void:
	if stamp == false:
		stamp = true
		$"Paper Stamp".color = Color.GREEN
	else:
		overload += 1
		print("Overload - stamp")

func FilePaper() -> void:
	$AnimationPlayer.play("paper_filed")


func ShredPaper() -> void:
	$AnimationPlayer.play("paper_shred")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "paper_filed" or anim_name == "paper_shred":
		MainManager.UpdateScore(self)
		queue_free()
