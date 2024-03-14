/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// En el evento Draw del objeto correspondiente:


draw_sprite_ext(coin2, 0, 40,160 , 2, 2, 0, c_yellow, 1); // Dibuja el sprite "spr_coin" en tamaño ampliado en la posición (10, 236)
draw_set_font(Font)
draw_text_color(140, 188, string(coins),c_black,c_black,c_black,c_black,1)// Muestra la cantidad de monedas al lado del sprite en un tamaño mayor

switch (Pvida) {
    case 0:
        draw_sprite(barra_vida, 0, 50, 50);
        break;
    case 25:
        draw_sprite(barra_vida, 1, 50, 50);
        break;
    case 50:
        draw_sprite(barra_vida, 2, 50, 50);
        break;
    case 75:
        draw_sprite(barra_vida, 3, 50, 50);
        break;
    case 100:
        draw_sprite(barra_vida, 4, 50, 50);
        break;
}
if (Pvida == 0) {
	Vidas -= 1;
	Obj_player.x = 10; // Cambiar la coordenada x del jugador a 10
    Obj_player.y = 850; // Cambiar la coordenada y del jugador a 850
	
}


switch (Vidas) {
    case 0:
        draw_sprite(spr_vidas, 0, 1320, 60);
        break;
    case 1:
        draw_sprite(spr_vidas, 1, 1320, 60);
        break;
    case 2:
        draw_sprite(spr_vidas, 2, 1320, 60);
        break;
    case 3:
        draw_sprite(spr_vidas, 3, 1320, 60);
        break;
    case 4:
        draw_sprite(spr_vidas, 4, 1320, 60);
        break;
}

if (Vidas <= 0) {
	audio_stop_all();
	audio_play_sound(game_over, 1000, true);
	room_goto(Room4);
} else if (Pvida == 0) {
    Pvida = 100; // Regenerar vida al máximo si Pvida llega a 0
}