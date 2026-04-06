/// @param text

function scr_text(_text){

	text[pageNum] = _text;
	pageNum++;

}


function scr_option(_option, _link_id){



}

// @param text_id
function create_textbox(_text_id){
	
	with(instance_create_depth(0,0,-9999,Obj_Textbox)){
	
		scr_game_text(_text_id);
	
	}
}