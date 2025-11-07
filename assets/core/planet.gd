extends RigidBody2D
class_name Planet

@export_file("*.tscn") var scene_file: String
@export var packed_scene: PackedScene
@export var radius: float = 100.0

static var planets: Array[Planet]

func _enter_tree() -> void:
	planets.append(self)
func _exit_tree() -> void:
	planets.erase(self)

func change_scene(_interactor: Node2D) -> void:
	if not scene_file.is_empty():
		get_tree().change_scene_to_file(scene_file)
	else:
		get_tree().change_scene_to_packed(packed_scene)
		
func ship_crashed(ship: Ship):
	change_scene(ship)
