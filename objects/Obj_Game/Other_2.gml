if(window_get_fullscreen() == false)
{
    window_set_fullscreen(true);
}
else window_set_fullscreen(false);

audio_play_sound(Sound1, 0, 1, 1.0, undefined, 1.0);