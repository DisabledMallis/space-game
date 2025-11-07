extends RigidBody2D
class_name Player

@export var interact_label: Label = null
@export var floor_raycast: RayCast2D = null

signal died()

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left") and linear_velocity.x > -50.0:
		linear_velocity.x += -100.0 * delta
	if Input.is_action_pressed("move_right") and linear_velocity.x < 50.0:
		linear_velocity.x += 100.0 * delta
	if Input.is_action_just_pressed("jump") and floor_raycast.is_colliding():
		linear_velocity.y = -250.0
		
	for itbl in Interactable.interactables:
		var interactable = itbl.get_interactable()
		if interactable.position.distance_to(position) < itbl.interact_radius:
			interact_label.text = itbl.interact_dialogue
			interact_label.visible = true
			if Input.is_action_just_pressed("interact"):
				itbl.interacted(self)
			return
	interact_label.visible = false
