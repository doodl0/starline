extends Bullet

func collide(delta: float):
	var collision_info = move_and_collide(velocity * delta);
	if collision_info:
		# if hitting enemy deal damage and destroy
		if false:
			queue_free();
		# else if hit boundary, bounce
		else:
			bounces -= 1;
			sprite.frame = 3 - bounces;
			if bounces == 0: queue_free();
			direction = velocity.bounce(collision_info.get_normal()).normalized();
			direction.x += (randf() - 0.5) * randomness;
			direction.y += (randf() - 0.5) * randomness;
			direction = direction.normalized();
	pass
