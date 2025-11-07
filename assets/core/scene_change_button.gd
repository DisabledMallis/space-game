extends Button
class_name SceneChangeButton

@export_file("*.tscn") var scene_file: String
@export var packed_scene: PackedScene

func change_scene() -> void:
	if not scene_file.is_empty():
		get_tree().change_scene_to_file(scene_file)
	else:
		get_tree().change_scene_to_packed(packed_scene)

func _ready() -> void:
	pressed.connect(change_scene)
