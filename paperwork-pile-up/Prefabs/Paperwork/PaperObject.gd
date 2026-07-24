extends PaperClass



func PaperSetup() -> void:
	$AnimationPlayer.play("paper_slide_in")
	
	if staple == 1:
		$"Paper Clip".color = Color.GREEN
	else:
		$"Paper Clip".color = Color.RED
	
	if stamp == 1:
		$"Paper Stamp".color = Color.GREEN
	else:
		$"Paper Stamp".color = Color.RED
	
	if signature == 1:
		$"Paper Signature".color = Color.GREEN
	else:
		$"Paper Signature".color = Color.RED

func AddStaple() -> void:
	staple += 1
	if staple == 1:
		$"Paper Clip".color = Color.GREEN
	else:
		$"Paper Clip".color = Color.ORANGE

func AddSignature() -> void:
	signature += 1
	if signature == 1:
		$"Paper Signature".color = Color.GREEN
	else:
		$"Paper Signature".color = Color.ORANGE


func AddStamp() -> void:
	stamp += 1
	if stamp == 1:
		$"Paper Stamp".color = Color.GREEN
	else:
		$"Paper Stamp".color = Color.ORANGE


func FilePaper() -> void:
	$AnimationPlayer.play("paper_filed")
	paper_ending = PROCESS.FILE


func ShredPaper() -> void:
	$AnimationPlayer.play("paper_shred")
	paper_ending = PROCESS.SHRED


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "paper_filed" or anim_name == "paper_shred":
		MainManager.UpdateScore(self)
		queue_free()
