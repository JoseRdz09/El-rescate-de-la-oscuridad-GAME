/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
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

var player = instance_nearest(x, y, Obj_player);

if Obj_player.x < Obj_Enemy.x{
		sprite_index = spr_enemy_left;
}
if Obj_player.x > Obj_Enemy.x{
		sprite_index = spr_enemy_right;
}
// Step Event (obj_enemy)


if (player != noone && distance_to_object(player) <= atkRango) {
    // Atacar al jugador
    player.Pvida -= 25; // Ajusta esto según tus necesidades
	
}
if (Evida2 <= 0) {
    instance_destroy(); // Destruir la instancia del enemigo
}

