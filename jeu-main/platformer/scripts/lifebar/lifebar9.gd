extends TextureProgress

func _physics_process(_delta):
	value = get_tree().root.get_node("niveau_09").get_node("perso").hp

