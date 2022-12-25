extends Sprite

func _on_porte_body_entered(body) :
	if body.name == "perso" :
		get_tree().change_scene("res://scenes/niveaux/niveau_06.tscn")
