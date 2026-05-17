if (room == target_room && image_index >= image_number - 1) {
	
	// spawn fade-out transition ONCE
    if (!instance_exists(Obj_Transition_2)) {
        var t = instance_create_layer(0, 0, "Instances", Obj_Transition_2);
		t.depth = -9999;
    }
	
    instance_destroy();
}

/*
// play fade animation first
image_speed = 1;

// when fully faded OUT
if (image_index >= image_number - 1 && !has_changed_room) {
    has_changed_room = true;

    room_goto(target_room);
}
*/