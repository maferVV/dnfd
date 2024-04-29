/// audio_play_soundy(soundid, priority, loops?, individual gain, soundy group [0=music 1=sfx], xx?, yy?)
var sid, priority, loops, gain, group, xx, yy, s;

if(argument_count < 5) return error("soundy: not enough arguments", noone);
sid = argument[0];
priority = argument[1];
loops = argument[2];
gain = argument[3];
group = argument[4];
xx = x; if(argument_count > 5) xx = argument[5];
yy = y; if(argument_count > 6) xx = argument[6];

s = audio_play_sound(sid, priority, loops);
// volume
var vol = gain * objGameManager.master_gain;
if(group == 0)
{
    vol *= objGameManager.music_gain;
    audio_sound_gain(s, vol, 0);
    // also add to music instances array
    objGameManager.music_array[array_length_1d(music_array)] = s;
}
else if(group == 1)
{   
    soundy_create_so(s, xx, yy, vol*objGameManager.sfx_gain);
}


return s;
