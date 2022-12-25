extends KinematicBody2D

var speed = 300
var jump_speed = 1000
var gravity = 40

var velocity = Vector2()
var hp = 150 
var playerAttack = false
var coins = 0

func _ready():
	print(coins)

func _physics_process(_delta):
	velocity.x = (int(Input.get_action_strength("right")) - int(Input.get_action_strength("left"))) * speed
	velocity.y += gravity 
	velocity = move_and_slide(velocity, Vector2(0, -1 ))    
	if Input.is_action_pressed("right") :
		$"perso-img".flip_h = false
		$"perso-img".play("courir")
		
	elif Input.is_action_pressed("left") :
		$"perso-img".flip_h = true
		$"perso-img".play("courir")
		
	elif Input.is_action_pressed("attaque") :
		$"perso-img".play("attaque")
		$zone_attaque/zone_attaque_hitbox.set_disabled(false)
		playerAttack = true	
		
	else :
		$"perso-img".play("respiration")
	if is_on_floor():
		if Input.is_action_pressed("jump") :
			velocity.y = -jump_speed
	else :
		$"perso-img".play("sauter")
		
	if get_slide_count() > 0:
		for i in range(get_slide_count()) :
			if "ennemi" in get_slide_collision(i).collider.name :
				velocity.y = -700
				hp -= 1


func _on_persoimg_animation_finished():
	$zone_attaque/zone_attaque_hitbox.set_disabled(true)
	if $"perso-img".animation == "attaque":
		playerAttack = false
		
func add_coin() :
	coins = coins + 1
	print(coins)
