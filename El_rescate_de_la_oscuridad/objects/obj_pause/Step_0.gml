/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
script_execute(get_input);

if key_pause{
	if(room != Pausa){
		if(instance_exists(Obj_player)){
			Obj_player.persistent = false;
			ispause = true;
			instance_activate_all()
		}
		room_previous(room)
		room_goto(Pausa);
	}else {
		room_goto_previous();
		instance_deactivate_all(true);
	}
}