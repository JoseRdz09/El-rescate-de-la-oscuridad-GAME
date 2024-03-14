/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
function scrMovement(hor, spd, width){
	var xTo = x + hor * spd;
	var moved = false;
	for (var i=1;i<4;i++) {
		var wall = collision_rectangle(xTo-width, y-i-1, xTo+width, y-i, spr_tierra_7_medieval, true, true);
		if (!wall || !wall.solid) {
			x = xTo;
			moved = true;
			if (vspeed == 0) {
				y -= i - 1;
			}
			break;
		}
	}
	if place_free(x,y+1){
	gravity = 1;
	}
	else{
	gravity = 0
	}
	if vspeed >= 20 {
		vspeed = 20;
	}
	if (vspeed == 0 && moved) {
		for (var i=1;i<4;i++) {
			var wall = collision_rectangle(xTo-width, y+i-1, xTo+width, y+i, spr_tierra_11_medieval, true, true);
			if (wall) {
				y += i;
				break;
			}
		}
	}
	
	image_xscale = hor;
}
	
sprite_index = spr_enemy_esqueleto_right;
image_xscale = dir;
scrMovement(dir, 1, width);
if (dir == 2 && x >= x2) {
    dir = -2;
} else if (dir == -2 && x <= x1) {
    dir = 2;
}

attack_timer = 0;           // Temporizador para el retraso entre ataques
attack_delay = 30;          // Retraso entre ataques en frames (ajusta según necesites)
damage_cooldown = room_speed * 4; // Tiempo en frames entre cada daño al jugador
death_timer = 0; // Tiempo antes de destruir la instancia después de la muerte

/// Step Event (Obj_enemy)

var player = instance_nearest(x, y, Obj_player);
if (player != noone && distance_to_object(player) <= atkRango) {
    // Inflictar daño al jugador cada 4 segundos
    if (damage_cooldown <= 0) {
        player.Pvida -= ataqueEnemigo;
        damage_cooldown = room_speed * 4;
    } else {
        damage_cooldown--;
    }
    
    // Si no está atacando y el temporizador alcanza el retraso
    if (!attacking && attack_timer <= 0) {
        attacking = true;
        attack_timer = attack_delay;

        // Reducir la salud del jugador
        player.Pvida -= ataqueEnemigo;

        // Cambiar el sprite del enemigo durante el ataque
        sprite_index = spr_enemy_esqueleto_atack1;
    } else if (attacking) {
        // Mantener el sprite de ataque mientras está atacando
        sprite_index = spr_enemy_esqueleto_atack1;
    }
} else {
    // Si no está atacando, volver al sprite normal del enemigo
    if (!attacking) {
        sprite_index = spr_enemy_esqueleto_right;
    }
}

// Actualizar el temporizador de ataque
if (attack_timer > 0) {
    attack_timer--;
    if (attack_timer <= 0) {
        attacking = false;
    }
}

if (Evida1 <= 0) {
    sprite_index = spr_enemy_warrior_dead;
    if (death_timer <= 0) {
        instance_destroy(); // Destruir la instancia del enemigo después de mostrar el sprite de muerte
    } else {
        death_timer--;
    }
}