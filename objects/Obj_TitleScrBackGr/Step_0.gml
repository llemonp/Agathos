// ===============================
// INPUT
// ===============================
var right_key  = keyboard_check_pressed(vk_right);
var left_key   = keyboard_check_pressed(vk_left);
var accept_key = keyboard_check_pressed(vk_space);

// ===============================
// GET CURRENT OPTION COUNT
// ===============================
Op_length = array_length(option[menu_level]);

// ===============================
// MOVE THROUGH MENU
// ===============================
pos += right_key - left_key;
if (pos >= Op_length) pos = 0;
if (pos < 0) pos = Op_length - 1;

// ===============================
// MENU ACTIONS
// ===============================

if (accept_key){
    switch(menu_level){
        // MAIN MENU
        case 0:
            switch(pos){
                case 0: room_goto(MainBedr); instance_destroy(); break; // Start Game
                case 1: menu_level = 1; pos = 0; break; // Settings
                case 2: game_end(); break; // Quit
            }
        break;
        
        // SETTINGS MENU
        case 1:
            switch(pos){
                case 0: // Window Size
                    // add your window size logic
                    break;
                case 1: // Brightness
                    menu_level = 2; // go to brightness adjustment submenu
                    pos = 0;
                    break;
                case 2: // Controls
                    menu_level = 3; // go to Controls "menu"
                    break;
                case 3: // Back
                    menu_level = 0; // back to main menu
                    pos = 0;
                    break;
            }
        break;
        
        // BRIGHTNESS MENU
        case 2:
            switch(pos){
                case 0: global.brightness = clamp(global.brightness - 0.05, 0, 2); break;
                case 1: global.brightness = clamp(global.brightness + 0.05, 0, 2); break;
                case 2: menu_level = 1; pos = 1; break; // Back to settings
            }
        break;

		case 3:
			menu_level = 0; // back to main menu
	        pos = 0;
			break;
    }
}