/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if instance_place(x, y, Obj_player) {
	audio_play_sound(moneda,900,false);
    // El jugador recogió la moneda
    instance_destroy(); // Destruye la moneda
    Obj_player.coins += value; // Incrementa el contador de monedas del jugador
}

