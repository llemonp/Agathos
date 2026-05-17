// show_debug_message("WARP CHECK"); prints when this object is executed

// prevent warp when player sleeps or is sitting
if (global.transitioning) exit;

var p = instance_find(Obj_player, 0);
if (p != noone && (p.is_sleeping || p.is_sitting)) exit;

if place_meeting(x, y, Obj_player) && !instance_exists(Obj_Transition){
	var inst = instance_create_depth(0, 0, -9999, Obj_Transition);
	inst.targetX = targetX;
	inst.targetY = targetY;
	inst.target_room = target_room;
}