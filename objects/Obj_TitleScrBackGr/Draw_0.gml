// ===============================
// GET CURRENT MENU LENGTH
// ===============================
Op_length = array_length(option[menu_level]);

// ===============================
// CALCULATE TOTAL WIDTH OF OPTIONS
// ===============================
var total_width = 0;
for (var i = 0; i < Op_length; i++) {
    total_width += string_width(option[menu_level][i]);
    if (i < Op_length - 1) total_width += Op_Space;
}

// ===============================
// CALCULATE BACKGROUND BOX POSITION
// ===============================
var box_x = x - total_width / 2 - Op_Border; // center horizontally, include border
var box_y = y - height / 2;                  // vertical center
var box_w = total_width + 2 * Op_Border;    // width includes borders
var box_h = height;                          // keep height fixed

// ===============================
// DRAW BACKGROUND BOX
// ===============================
draw_set_alpha(0);
draw_set_color(c_black);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);

// reset alpha so other objects aren't affected
draw_set_alpha(1);


// ===============================
// DRAW MENU OPTIONS
// ===============================
draw_set_font(global.font_main);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

var current_x = box_x + Op_Border;
var text_y = box_y + box_h / 2;

for (var i = 0; i < Op_length; i++) {
    var _c = (pos == i) ? c_olive : c_white;
    draw_text_color(current_x, text_y, option[menu_level][i], _c, _c, _c, _c, 1);
    current_x += string_width(option[menu_level][i]) + Op_Space;
}

if (menu_level == 3) {
	var w = 600;
	var h = 500;
    draw_sprite_stretched(spr_controls2, 0, 0, 100, w, h);
	draw_sprite_stretched(Spr_controls1, 0, 600, 100, w, h);
}