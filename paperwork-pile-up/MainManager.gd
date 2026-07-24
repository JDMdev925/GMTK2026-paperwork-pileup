extends Node

var PaperGenerator : Node2D
var score : int
var paper_stack : int = 10

func _ready() -> void:
	score = 0

func RegisterNode(id : String, node: Node2D) -> void:
	match(id):
		"PaperGenerator":
			PaperGenerator = node
		_:
			pass

func UpdateScore(paper : PaperClass) -> void:
	
	
	
	match(paper.paper_ending):
		
		PaperClass.PROCESS.FILE:
			
			for x in (paper.staple + 1):
				if x == 1:
					score += 20
				elif x > 1:
					score -= 5
				else:
					score -= 10
			
			for x in (paper.stamp + 1):
				if x == 1:
					score += 20
				elif x > 1:
					score -= 5
				else:
					score -= 10
			
			for x in (paper.signature + 1):
				if x == 1:
					score += 20
				elif x > 1:
					score -= 5
				else:
					score -= 10
		
		PaperClass.PROCESS.SHRED:
			
			for x in (paper.staple + 1):
				if x == 0:
					score += 10
				else:
					score -= 10
	
	if paper_stack != 0:
		if PaperGenerator != null:
			paper_stack -= 1
			PaperGenerator.GenerateNewPaper()
	else:
		print("Final Score: ", score)
