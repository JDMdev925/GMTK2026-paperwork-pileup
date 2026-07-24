extends Node2D

class_name PaperClass

enum PROCESS{
	FILE,
	SHRED
}

@export_category("Paper Variables")
@export_group("Paper Conditions")

@export var staple : int = 0
@export var stamp : int = 0
@export var signature : int = 0

@export var unix_date : float = 0
@export var overload : int = 0
@export var paper_process : PROCESS = PROCESS.FILE
@onready var paper_ending : PROCESS = PROCESS.FILE
