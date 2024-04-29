for(var i = 0; i < array_length_1d(music_array); i++)
{
    s = music_array[i];
    vol = master_gain * music_gain;
    audio_sound_gain(s, vol, 0);
}
