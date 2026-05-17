depth = -999;

textbox_height = 50;
textbox_width = 180;

border = 8;
line_sep = 12;
line_width = textbox_width - border * 2;

txtb_spr = spr_Textbox;
txtb_img = 0;
txtb_img_spd = 0.1;

page = 0;
pageNum = 0;
text_length = [];
text_x_offset = [];

char[0,0] = "";
char_y[0,0] = "";
char_x[0,0] = "";
draw_char = 0;
text_spd = 1;

setup = false;
accept_key = false;

// options for text dialogue when you chat with npc's
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

// animating the textbox
box_open = 0;          // 0 = hidden, 1 = fully shown
box_open_spd = 0.08;   // speed of opening

box_alpha = 0;
target_y_offset = 0;
start_y_offset = 20;   // starts slightly lower

// effects
scr_set_defaults_for_text();
last_free_space = 0;