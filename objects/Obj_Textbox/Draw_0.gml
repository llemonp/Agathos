draw_set_font(Textfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

box_open = min(box_open + box_open_spd, 1);
box_alpha = box_open;

textbox_x = camera_get_view_x(view_camera[0]) + 35;
textbox_y = camera_get_view_y(view_camera[0]) + 125;

if (setup == false)
{
    setup = true;

    // loop thru pages
    for (var p = 0; p < pageNum; p++)
    {
        // find how many characters on each page and store this to the text_length array
        text_length[p] = string_length(text[p]);

        // get the x position of the textbox
        text_x_offset[p] = 44;
		
		line_break_offset[p] = 0;
		line_break_num[p] = 0;
		last_free_space = 0;
		
		// setting individual characters so we know where to break lines
		for(var c = 0; c < text_length[p]; c++)
		{
			var _char_pos = c+1;
			
			// store individual characters into char array
			char[c,p] = string_char_at(text[p], _char_pos);
			
			// get current width of line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char);
			
			// get the last free space
			if (char[c,p] == " ") {
			    last_free_space = _char_pos + 1;
			}
			
			var _current_txt_x = string_width(_txt_up_to_char);
			
			// get the line breaks
			if (_current_txt_x - line_break_offset[p] > line_width)
			{
			    // fallback if no space found
			    var break_pos = last_free_space;

			    if (break_pos <= 0) {
			        break_pos = _char_pos; // break at current character instead
			    }

			    line_break_pos[line_break_num[p], p] = break_pos;
			    line_break_num[p]++;

			    var _txt_up_to_last_space = string_copy(text[p], 1, break_pos);

			    var _last_char = string_char_at(text[p], break_pos);

			    line_break_offset[p] =
			        string_width(_txt_up_to_last_space) - string_width(_last_char);
			}
			
		}
		
		// getting each character's coordinates
		for (var c = 0; c < text_length[p]; c++)
		{
			var _char_pos = c+1;
			var _txt_x = textbox_x + border + 45;
			var _txt_y = textbox_y + border;
			// get current width of line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c,p]);
			var _txt_line = 0;
			
			// compensate for string breaks
			for(var lb = 0; lb < line_break_num[p]; lb++)
			{
				// if current looping character is after a line break
				if _char_pos >= line_break_pos[lb, p]
				{
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
					_current_txt_w = string_width(_str_copy);
					
					_txt_line = lb+1;
				}
				
			}
			
			// add to the x and y coordinates based on the new info
			char_x[c,p] = _txt_x + _current_txt_w;
			char_y[c,p] = _txt_y + _txt_line*line_sep;
			
		}
    }
}

// typing the text
if (draw_char < text_length[page])
{
    draw_char += text_spd;
    draw_char = clamp(draw_char, 0, text_length[page]);
}

// flip through pages
if (accept_key)
{
    if (draw_char == text_length[page])
    {
        // next page
        if (page < pageNum - 1)
        {
            page++;
            draw_char = 0;
        }
        // destroy the textbox
        else
        {
			if option_number > 0
			{
				create_textbox(option_link_id[option_pos])
			}
				
            instance_destroy();
        }
    }
    else
    {
        draw_char = text_length[page];
    }
}


// draw the textbox
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;

if (txtb_img >= sprite_get_number(txtb_spr))
{
    txtb_img = 0;
}

txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

var anim_y = textbox_y + lerp(start_y_offset, target_y_offset, box_open);
var anim_xscale = box_open;
var anim_yscale = box_open;

// back of the textbox
draw_sprite_ext(
    txtb_spr,
    floor(txtb_img),
    _txtb_x,
    anim_y,
    (textbox_width / txtb_spr_w) * anim_xscale,
    (textbox_height / txtb_spr_h) * anim_yscale,
    0,
    c_white,
    box_alpha
);


// options
if draw_char == text_length[page] && page == pageNum - 1
	{
		// option selection
		option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
		option_pos = clamp(option_pos, 0, option_number - 1)
		
		
		// drawing and placement of options
		var _op_space = 15;
		var _op_border = 4;
		for (var op = 0; op < option_number; op++)
			{
				// the option box
				var _o_w = string_width(option[op]) + _op_border*2;
				
				var _y = _txtb_y - _op_space * option_number + _op_space * op;

				// transparent highlight (ONLY for selected option)
				if (op == option_pos) {
				    draw_set_alpha(0.5);
					draw_set_color(c_white);
					
				    draw_rectangle(
				        _txtb_x - 2,
				        _y - 2,
				        _txtb_x + _o_w + 2,
				        _y + _op_space - 2,
				        false
				    );

				    draw_set_alpha(1);
				}
				
				draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y - _op_space * option_number + _op_space * op, _o_w/txtb_spr_w, (_op_space-1)/txtb_spr_h, 0, c_white, 1);
				
				// the option text
				draw_text(_txtb_x + _op_border, _txtb_y - _op_space * option_number + _op_space * op + 2, option[op]);
			}
		
	}
	

	/*
    var _drawtext = string_copy(text[page], 1, draw_char);
    draw_text_ext(
        textbox_x + text_x_offset[page] + border,
        anim_y + border,
        _drawtext,
        line_sep,
        line_width
    );
	*/

for(var c = 0; c < draw_char; c++)
{
	// the text
	draw_text(char_x[c, page], char_y[c, page], char[c, page]);
}
	