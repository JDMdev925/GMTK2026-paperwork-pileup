extends Node

var PaperGenerator : Node2D
var score : int
var paper_stack : int = 9
var total_time : float = 30
var game_ended : bool = false

@onready var mouse_idle : Texture = preload("res://General Assets/Cursor/cursor_none.svg")
@onready var mouse_hover : Texture = preload("res://General Assets/Cursor/hand_thin_point.svg")
@onready var mouse_click : Texture = preload("res://General Assets/Cursor/hand_thin_small_point.svg")
enum POINTER{
	IDLE,
	HOVER,
	CLICK
}


func _ready() -> void:
	score = 0
	Input.set_custom_mouse_cursor(mouse_idle, Input.CURSOR_ARROW, Vector2(8, 5))
	Input.set_custom_mouse_cursor(mouse_hover, Input.CURSOR_POINTING_HAND, Vector2(8, 5))

func RegisterNode(id : String, node: Node2D) -> void:
	match(id):
		"PaperGenerator":
			PaperGenerator = node
		_:
			pass

func CursorClick():
	AudioController.PlaySFX(AudioController.SFX.CLICK)
	Input.set_custom_mouse_cursor(mouse_click, Input.CURSOR_POINTING_HAND, Vector2(8, 5))
	await get_tree().create_timer(0.1).timeout
	Input.set_custom_mouse_cursor(mouse_hover, Input.CURSOR_POINTING_HAND, Vector2(8, 5))

func UpdateScore(paper : PaperClass) -> void:
	
	if paper.paper_process == paper.paper_ending:
		score += 20
	else:
		score -= 20
	
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
	
	if paper_stack != 0 and game_ended != true:
		if PaperGenerator != null:
			paper_stack -= 1
			PaperGenerator.GenerateNewPaper()
	else:
		EndGame(true)

func NewGame(stack :int, time : float) -> void:
	paper_stack = stack
	total_time = time
	score = 0
	game_ended = false
	get_tree().change_scene_to_file("res://Scenes/Main Game/MainGame.tscn")

func EndGame(success : bool) -> void:
	game_ended = true
	if success:
		score += 50
	else:
		score -= 50
	get_tree().change_scene_to_file("res://Scenes/Results/ResultsScene.tscn")
