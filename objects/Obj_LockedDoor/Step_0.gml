var p = instance_find(Obj_player, 0);

// check player exists and is close enough
if (p != noone) {
    
    var dist = point_distance(x, y, p.x, p.y);
    
    // press F near object
    if (dist < 24 && keyboard_check_pressed(ord("F"))) {
        
        // prevent multiple textboxes
        if (!instance_exists(Obj_Textbox)) {
            create_textbox(text_id);
        }
    }
}