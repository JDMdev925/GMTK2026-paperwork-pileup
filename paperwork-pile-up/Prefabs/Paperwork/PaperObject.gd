extends PaperClass

func PaperSetup() -> void:
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

func TempUpdate() -> void:
	if staple == false:
		staple = true
		$"Paper Clip".color = Color.GREEN
