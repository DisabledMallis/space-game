extends Node
class_name SceneChangeInteraction

@export_file("*.tscn") var scene_file: String
@export var packed_scene: PackedScene
@export var interactable: Interactable

func change_scene(_interactor: Node2D) -> void:
	if not scene_file.is_empty():
		get_tree().change_scene_to_file(scene_file)
	else:
		get_tree().change_scene_to_packed(packed_scene)

func _ready() -> void:
	interactable.on_interacted.connect(change_scene)
