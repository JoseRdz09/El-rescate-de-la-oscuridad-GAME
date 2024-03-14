/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var spikeCollision = instance_place(x, y, Obj_pinchos);
if (spikeCollision != noone) {
    x = 10; // Teletransportar al jugador a las coordenadas (10, 10)
    y = 850;

}

#region // Variables

var sal = keyboard_check_pressed(vk_space);
var qui = keyboard_check(vk_nokey);
var izq = keyboard_check(ord("A"));
var der = keyboard_check(ord("D"));

#endregion

#region // Movimento y animaciones


if sal && not place_free(x,y + 1) {
	sprite_index = spr_player_jumpin;
	vspeed = - PSalto;
}

if keyboard_check(vk_down){
	y = y + 10;
}

if der{
	sprite_index = spr_player_run_rigth;
	x = x + 10;
}

if izq{
	sprite_index = spr_player_run_left;
	x = x - 10;
}
if qui {
	sprite_index = spr_player_quiet;
}

#endregion

#region // Gravedad

if place_free(x, y+1) {
    gravity = 1;
}
else {
    gravity = 0;
}
if vspeed >= 20 {
    vspeed = 20;
}
#endregion 
// Almacenar el estado anterior del botón del mouse
var prevAttackKey = attackKey;

// Obtener el estado actual del botón del mouse
attackKey = mouse_check_button_pressed(mb_left);

// Código de ataque del jugador
if (attackKey && attackTimer <= 0) {
    // Obtener la posición x del puntero del mouse en relación con la posición del jugador
    audio_play_sound(golpe, 1000, false);
    var mouseXRelativeToPlayer = mouse_x - x;

    if (mouseXRelativeToPlayer >= 0) {
        sprite_index = spr_player_attack;
        // Animación de ataque hacia la derecha
    } else {
        sprite_index = spr_player_attack_left;
        // Animación de ataque hacia la izquierda
    }
    
    attackTimer = atkefri;

    var enemy = instance_place(x, y, Object27);
    if (enemy != noone && distance_to_object(enemy) <= atkRango) {
        enemy.Evida -= DamagePly;

        // Mover al enemigo si está mirando hacia la izquierda
        if (sprite_index == spr_player_attack_left || sprite_index == spr_player_run_left) {
            enemy.x -= 100;
        } else {
            enemy.x += 100;
        }
    }
    
    enemy = instance_place(x, y, enemy_esqueleto);
    if (enemy != noone && distance_to_object(enemy) <= atkRango) {
        enemy.Evida1 -= DamagePly;

        // Mover al enemigo si está mirando hacia la izquierda
        if (sprite_index == spr_player_attack_left || sprite_index == spr_player_run_left) {
            enemy.x -= 100;
        } else {
            enemy.x += 100;
        }
    }
}

if (attackTimer > 0) {
    attackTimer--;
}

// Restaurar el estado anterior del botón del mouse para la próxima iteración
prevAttackKey = attackKey;

if (coins >= 100) {
    Vidas += 1; // Incrementa las vidas en 1
    coins = 0; // Reinicia el contador de monedas
} 
