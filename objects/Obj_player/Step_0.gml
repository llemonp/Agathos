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

    // EXIT COUCH
    if (is_sitting && sit_couch != noone) {
        is_sitting = false;
        sit_couch = noone;

        sprite_index = FrontPlayer;
        image_speed = 0.75;
        image_index = 0;
    }
    // EXIT BED
    else if (is_sleeping && sleep_bed != noone) {
        is_sleeping = false;
        sleep_bed = noone;

        sprite_index = FrontPlayer;
        image_speed = 0.75;
        image_index = 0;
    }
    // ENTER COUCH
    else if (couch != noone) {
        is_sitting = true;
        sit_couch = couch;
        just_entered = true;

        sprite_index = Sit_idle;
        image_index = 0;
        image_speed = 1;
    }
    // ENTER BED
    else if (bed != noone) {
        is_sleeping = true;
        sleep_bed = bed;
        just_entered = true;

        sprite_index = SleepPlayer;
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
    else if (is_sleeping && sleep_bed != noone) {
        x = sleep_bed.x + sleep_bed.snap_x;
        y = sleep_bed.y + sleep_bed.snap_y;
    }
    just_entered = false;
}

/// ===============================
/// LOCK PLAYER WHILE USING FURNITURE
/// ===============================
var can_move = !(is_sitting && sit_couch != noone) && !(is_sleeping && sleep_bed != noone);

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

    // idle/walk animation
    if (horizontal == 0 && vertical == 0) {
        sprite_index = FrontPlayer;
        image_speed = 0.55;
    } else {
        image_speed = 1;
    }
}
else {
    // lock player sprite while sitting or sleeping
    if (is_sitting && sit_couch != noone) {
        x = sit_couch.x + sit_couch.snap_x;
        y = sit_couch.y + sit_couch.snap_y;
        sprite_index = Sit_idle;
        image_speed = 0.75;
    } 
    else if (is_sleeping && sleep_bed != noone) {
        x = sleep_bed.x + sleep_bed.snap_x;
        y = sleep_bed.y + sleep_bed.snap_y;
        sprite_index = SleepPlayer;
        image_speed = 0.5;
    }
}


/*
// access the menu w/escape
if (keyboard_check_pressed(vk_escape)) {
    // Check if the pause menu exists in the room
    if (!instance_exists(Obj_PauseMenu)) {
        // Create the pause menu on the UI layer
        instance_create_layer(0, 0, "UI", Obj_PauseMenu);
    } else {
        // Destroy the menu if it exists
        with (Obj_PauseMenu) instance_destroy();
    }
}
*/

