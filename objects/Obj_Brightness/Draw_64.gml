if (global.brightness == 1) exit;

// Darken
if (global.brightness < 1) {
    var a = 1 - global.brightness;
    draw_set_color(c_black);
    draw_set_alpha(a);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
}

// Brighten
if (global.brightness > 1) {
    var a = (global.brightness - 1) * 0.5;
    draw_set_color(c_white);
    draw_set_alpha(a);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
}

// RESET (critical)
draw_set_alpha(1);
draw_set_color(c_white);
