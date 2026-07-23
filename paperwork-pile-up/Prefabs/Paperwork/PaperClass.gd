extends Node2D

class_name PaperClass

enum PROCESS{
	FILE,
	SHRED
}

@export_category("Paper Variables")
@export_group("Paper Conditions")
@export var staple : bool = false
@export var stamp : bool = false
@export var signature : bool = false
@export var paper_process : PROCESS = PROCESS.FILE
