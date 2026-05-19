var _s = id;

// when the player presses space the next set of dialogue will run
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("F")) && !instance_exists(Obj_Textbox))
{

	create_textbox(text_id);
	
}
