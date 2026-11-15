extends Bullet

func collide(delta: float):
	var collision_info = move_and_collide(velocity * delta);
	if collision_info:
		# if hitting player deal damage and destroy
		if collision_info.get_collider().has_method("damage"):			
			collision_info.get_collider().call("damage", damage);
			queue_free();
		# else if hit boundary, bounce
		else:
			bounces -= 1;
			sprite.frame = 3 - bounces;
			if bounces == 0: queue_free();
			direction = velocity.bounce(collision_info.get_normal()).normalized();
			setRandomDirection(randomness)
			direction = direction.normalized();
	pass
