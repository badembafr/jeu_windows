extends KinematicBody2D

const speed = 60
const FLOOR = Vector2(0, -1)
const gravity = 20 

var direction = 1
var velocity =  Vector2()
var is_dead = false

func _physics_process(_delta):
	if is_dead == false:
		velocity.x = speed * direction 
		if direction == 1 :
			$"ennemi-img".flip_h = false 
		else :
			$"ennemi-img".flip_h = true
			
		$"ennemi-img".play("walk")
		velocity.y +=  gravity 
		velocity = move_and_slide(velocity, FLOOR)
		
		if is_on_wall():
			direction = direction * -1
			
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("coup") :
		is_dead = true
		$"ennemi-img".play("mort")
		

func _on_AnimatedSprite_animation_finished():
	if $"ennemi-img".animation == "mort" :
		queue_free()
