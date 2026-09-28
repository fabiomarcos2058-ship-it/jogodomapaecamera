extends Area2D

# Quando o jogador encosta na bandeira, o jogo mostra a mensagem de vitória
# e recomeça a fase depois de alguns segundos.

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.set_physics_process(false)
		$Vitoria.visible = true
		await get_tree().create_timer(3.0).timeout
		get_tree().reload_current_scene()
