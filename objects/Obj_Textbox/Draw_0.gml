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
            instance_destroy();
        }
    }
    else
    {
        draw_char = text_length[page];
    }
}

// draw the textbox
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
    textbox_x + text_x_offset[page],
    anim_y,
    (textbox_width / txtb_spr_w) * anim_xscale,
    (textbox_height / txtb_spr_h) * anim_yscale,
    0,
    c_white,
    box_alpha
);

if (box_open > 0.8)
{
    draw_set_font(Textfont);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);

    var _drawtext = string_copy(text[page], 1, draw_char);
    draw_text_ext(
        textbox_x + text_x_offset[page] + border,
        anim_y + border,
        _drawtext,
        line_sep,
        line_width
    );
}