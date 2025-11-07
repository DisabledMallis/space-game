extends Node
class_name Interactable

@export var interact_dialogue: String = "Press E to interact"
@export var interact_radius: float = 20.0

signal on_interacted(interactor: Node2D)

static var interactables: Array[Interactable]

func _enter_tree() -> void:
	interactables.append(self)
func _exit_tree() -> void:
	interactables.erase(self)

func get_interactable() -> Node2D:
	return get_parent() as Node2D

func interacted(interactor: Node2D):
	on_interacted.emit(interactor)
