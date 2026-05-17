/// @param text
// npc dialogue

function scr_game_text(_text_id){

	switch(_text_id){
		
		case "npc 1":
			scr_text("I am npc 1");
			scr_text("My favorite food is sushi");
				// text options
				scr_option("Yeah I love sushi!!", "npc 1 - yes");
				scr_option("No I hate sushi..", "npc 2 - no");
			break;
			
			// npc response
			case "npc 1 - yes":
				scr_text("Wow we have so much in common! Lets talk about sushi all day long everyday.");
				break;
			case "npc 2 - no":
				scr_text("Oh, well..");
				scr_text("That's okay too.");
				break;
		
		case "npc 2":
			scr_text("I am npc 2");
			scr_text("My favorite food is pizza");
			break;
		
	}

}