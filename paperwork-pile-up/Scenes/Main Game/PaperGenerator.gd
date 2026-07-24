extends Node2D

@export var paper_prefab : PackedScene
@export var current_date : float
var past_year : float = 34214400

func _ready() -> void:
	GenerateNewPaper()
	current_date = Time.get_unix_time_from_system()

func CoinFlip() -> bool:
	var coin : int = randi_range(0, 2)
	if coin == 2:
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
		paper.unix_date = randf_range(current_date - past_year, current_date)
	else:
		paper.paper_process = PaperClass.PROCESS.SHRED
		paper.unix_date = randf_range(current_date - past_year, current_date) - past_year
	print(Time.get_datetime_dict_from_unix_time(paper.unix_date))
	paper.staple = CoinFlip()
	paper.stamp = CoinFlip()
	paper.signature = CoinFlip()
	print("PAPER: ", paper.paper_process, ", ", paper.staple, ", ", paper.stamp, ", ", paper.signature)
	paper.PaperSetup()
	
