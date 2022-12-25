extends TextureProgress

func _physics_process(_delta):
	value = get_tree().root.get_node("niveau_04").get_node("perso").hp

