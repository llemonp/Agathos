/// @param text

// repositions text so it doesnt go in a continuous line
function scr_set_defaults_for_text() {
	line_break_pos[0, pageNum] = 999;	
	line_break_num[pageNum] = 0;
	line_break_offset[pageNum] = 0
}

function scr_text(_text){

	text[pageNum] = _text;
	pageNum++;

}


function scr_option(_option, _link_id){
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;

}

// @param text_id
function create_textbox(_text_id){
	
	with(instance_create_depth(0,0,-9999,Obj_Textbox)){
	
		scr_game_text(_text_id);
	
	}
}