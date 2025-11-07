extends Node
class_name ShipController

@export var jet_force: float = 1000.0

func get_ship() -> RigidBody2D:
	return get_parent() as RigidBody2D

func _process(delta: float) -> void:
	var ship = get_ship()
	if Input.is_action_pressed("steer_left"):
		ship.angular_velocity = -PI;
	if Input.is_action_pressed("steer_right"):
		ship.angular_velocity = PI;
	if Input.is_action_pressed("throttle"):
		var direction = Vector2.from_angle(ship.rotation - (PI * 0.5))
		ship.linear_velocity += direction * delta * jet_force
	
	if ship.linear_velocity.length() > 150.0:
		ship.linear_velocity = ship.linear_velocity.normalized() * 150.0
		
	for planet in Planet.planets:
		var distance = planet.position.distance_to(ship.position)
		print("Dist to planet: ", distance)
		if distance <= planet.radius:
			planet.ship_crashed(ship)
