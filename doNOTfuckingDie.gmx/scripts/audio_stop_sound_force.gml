/// audio_stop_sound_force(sndid)
// stops sound regardess if its playing or not
if audio_is_playing(argument0)
{
    audio_stop_sound(argument0);
    return 1;
}
return 0;
