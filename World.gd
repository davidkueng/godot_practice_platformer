extends Node2D

func _ready():
	pass

func _physics_process(delta):
		if $Player.position.x >= 204 and $Player.position.y <= -250:
			$Win.visible = true
		
		if $Win.visible == true:
			if Input.is_action_just_pressed('restart'):
				get_tree().reload_current_scene()
			
