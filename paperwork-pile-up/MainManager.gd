extends Node

var PaperGenerator : Node2D

func RegisterNode(id : String, node: Node2D) -> void:
	match(id):
		"PaperGenerator":
			PaperGenerator = node
		_:
			pass

func UpdateScore(paper : PaperClass) -> void:
	
	if PaperGenerator != null:
		PaperGenerator.GenerateNewPaper()
