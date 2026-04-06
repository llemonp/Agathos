width = 900;
height = 70;

Op_Border = 8; // how much space is between the border and text
Op_Space = 45; // space bwteen the options

// pause
option = [];
option[0, 0] = "Start Game";
option[0, 1] = "Settings";
option[0, 2] = "Quit Game";

// settings menu
option[1, 0] = "Volume";
option[1, 1] = "Brightness";
option[1, 2] = "Controls";
option[1, 3] = "Back";

// brightness setting
global.brightness = 1; // normal brightness

persistent = true;

if (!variable_global_exists("brightness")) {
    global.brightness = 1; // default brightness
}

// brightness menu
option[2,0] = "Decrease";
option[2,1] = "Increase";
option[2,2] = "Back";

// controls setting
option[3, 0] = "Back"

Op_length = 0;
menu_level = 0;
pos = 0;