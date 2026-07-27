extends Node2D

@export var paper_prefab : PackedScene
@export var current_date : float
var past_year : float = 34214400

func _ready() -> void:
	MainManager.RegisterNode("PaperGenerator", self)
	current_date = Time.get_unix_time_from_system()
	GenerateNewPaper()


func CoinFlip() -> int:
	var coin : int = randi_range(0, 2)
	if coin == 2:
		return 1
	else:
		return 0


func GenerateNewPaper() -> void:
	
	var new_paper : PaperClass = paper_prefab.instantiate()
	
	if (new_paper != null):
		self.add_child(new_paper)
		DetermineStartingConditions(new_paper)

func DetermineStartingConditions(paper : PaperClass) -> void:
	if randi_range(0, 1) == 0:
		paper.paper_process = PaperClass.PROCESS.FILE
		paper.unix_date = randf_range(current_date - past_year, current_date)
		paper.staple = CoinFlip()
	else:
		paper.paper_process = PaperClass.PROCESS.SHRED
		paper.unix_date = randf_range(current_date - past_year, current_date) - past_year
		paper.staple = 0
	

	paper.stamp = CoinFlip()
	paper.signature = CoinFlip()
	print("PAPER: ", PaperClass.PROCESS.keys()[paper.paper_process], ", ", paper.staple, ", ", paper.stamp, ", ", paper.signature)
	paper.PaperSetup()
	
