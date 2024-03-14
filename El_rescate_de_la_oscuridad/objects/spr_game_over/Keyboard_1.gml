/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
cual = keyboard_check(vk_enter);
audio_stop_all();
if cual{
	room_goto(Room2);
	instance_deactivate_all(barra_vid);
	instance_deactivate_all(Obj_coin);
}