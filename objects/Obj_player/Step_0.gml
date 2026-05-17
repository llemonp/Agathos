/// ===============================
/// FIND FURNITURE (ONLY COUCH & BED)
/// ===============================
var couch = instance_place(x, y, Obj_Couch);
var bed   = instance_place(x, y, Obj_Bed);

/// ===============================
/// INTERACT (SINGLE KEY PRESS)
/// F key: exit first, then enter
/// ===============================
if (keyboard_check_pressed(ord("F"))) {
	
	// PRIORITY: TEXT INTERACTION FIRST
	var interact = instance_place(x, y, Obj_LockedDoor);

	if (interact != noone && !instance_exists(Obj_Textbox)) {
	    interact.create_textbox(interact.text_id);
	    exit;
	}

    // EXIT COUCH
    if (is_sitting && sit_couch != noone) {
        is_sitting = false;
        sit_couch = noone;

        sprite_index = Player_Idle;
        image_speed = 0.75;
        image_index = 0;
    }

    // EXIT BED
    else if (is_sleeping) {
        is_sleeping = false;
        sleep_bed = noone;

        sprite_index = Player_Idle;
        image_speed = 0.75;
        image_index = 0;

        global.transitioning = false; // 🔥 SAFE RESET
    }

    // ENTER COUCH
    else if (couch != noone) {
        is_sitting = true;
        sit_couch = couch;
        just_entered = true;

        sprite_index = Player_Sit;
        image_index = 0;
        image_speed = 1;
    }

    // ENTER BED
    else if (bed != noone) {
        is_sleeping = true;
        sleep_bed = bed;

        sleep_x = bed.x + bed.snap_x;
        sleep_y = bed.y + bed.snap_y;

        just_entered = true;

        sprite_index = Player_Sleep;
        image_index = 0;
        image_speed = 0.5;
    }
}

/// ===============================
/// SNAP TO FURNITURE (ONCE)
/// ===============================
if (just_entered) {
    if (is_sitting && sit_couch != noone) {
        x = sit_couch.x + sit_couch.snap_x;
        y = sit_couch.y + sit_couch.snap_y;
    } 
    else if (is_sleeping) {
        x = sleep_x;
        y = sleep_y;
    }

    just_entered = false;
}

/// ===============================
/// LOCK PLAYER WHILE USING FURNITURE
/// ===============================
var can_move = !(is_sitting || is_sleeping) && !instance_exists(Obj_Textbox);

/// ===============================
/// MOVEMENT + IDLE/WALK
/// ===============================
if (can_move) {

    var horizontal = (keyboard_check(vk_right) || keyboard_check(ord("D"))) -
                     (keyboard_check(vk_left)  || keyboard_check(ord("A")));

    var vertical   = (keyboard_check(vk_down)  || keyboard_check(ord("S"))) -
                     (keyboard_check(vk_up)    || keyboard_check(ord("W")));

    x += horizontal * move_speed;
    y += vertical   * move_speed;

    if (horizontal == 0 && vertical == 0) {
        sprite_index = Player_Idle;
        image_speed = 0.55;
    } else {
        image_speed = 1;
    }
}
else {

    if (is_sitting && sit_couch != noone) {
        x = sit_couch.x + sit_couch.snap_x;
        y = sit_couch.y + sit_couch.snap_y;
        sprite_index = Player_Sit;
        image_speed = 0.75;
    } 
    else if (is_sleeping) {
        x = sleep_x;
        y = sleep_y;
        sprite_index = Player_Sleep;
        image_speed = 0.5;
    }
}