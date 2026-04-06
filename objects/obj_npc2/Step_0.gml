var _s = id;

if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)
{

	with(instance_create_depth(0, 0, -999, Obj_Textbox))
	{
		
		scr_game_text(_s.text_id);
	
	}
}