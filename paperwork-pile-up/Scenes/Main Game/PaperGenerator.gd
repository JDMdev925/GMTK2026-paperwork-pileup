extends Node2D

@export var paper_prefab : PackedScene

func _ready() -> void:
	GenerateNewPaper()

func CoinFlip() -> bool:
	var coin : int = randi_range(0, 1)
	if coin == 1:
		return true
	else:
		return false


func GenerateNewPaper() -> void:
	
	var new_paper : PaperClass = paper_prefab.instantiate()
	
	if (new_paper != null):
		self.add_child(new_paper)
		DetermineStartingConditions(new_paper)

func DetermineStartingConditions(paper : PaperClass) -> void:
	if CoinFlip() == true:
		paper.paper_process = PaperClass.PROCESS.FILE
	else:
		paper.paper_process = PaperClass.PROCESS.SHRED
	
	paper.staple = CoinFlip()
	paper.stamp = CoinFlip()
	paper.signature = CoinFlip()
	print("PAPER: ", paper.paper_process, ", ", paper.staple, ", ", paper.stamp, ", ", paper.signature)
	paper.PaperSetup()
	
