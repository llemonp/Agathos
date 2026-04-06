if place_meeting(x, y, Obj_player) && !instance_exists(Obj_Transition){
	var inst = instance_create_depth(0, 0, -9999, Obj_Transition);
	inst.targetX = targetX;
	inst.targetY = targetY;
	inst.target_room = target_room;
}