// OPEN when player collides
if (place_meeting(x, y, Obj_player))
{
    if (!opened)
    {
		sprite_index = Door_Open;
	    image_index = 0;
	    image_speed = 1.25;
        opened = true;
        alarm[0] = room_speed * 5; // ⏱ stays open 5 seconds
    }
}

// HANDLE ANIMATION
if (opened)
{
    if (allow_animation)
    {
        // Animate door opening
        image_speed = 1;

        if (image_index >= image_number - 1)
        {
            image_index = image_number - 1;
            image_speed = 0;

            // Play sound only once
            if (!sound_played)
            {
                audio_play_sound(DoorCreek, 1, false);
                sound_played = true;
            }
        }
    }
    else
    {
        // instantly open
        image_speed = 0;
        image_index = image_number - 1;
        sound_played = true;
    }
}
else
{
    if (allow_animation)
    {
        // Animate closing
        image_speed = -1;

        if (image_index <= 0)
        {
            image_index = 0;
            image_speed = 0;
            sound_played = false;
        }
    }
    else
    {
        // instantly closed
        image_speed = 0;
        image_index = 0;
        sound_played = false;
    }
}