extends Tower

func shoot(tar)-> void:
	tar.get_parent().take_damage(stats.bullet_damage)
