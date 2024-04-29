/// audio_play_sound_vol(soundid, priority, loops, vol, [time])
// audio_play_sound but with volume integrated
var soundid, p, l, v, t, temp;
soundid = argument[0];
p = argument[1];
l = argument[2];
v = argument[3];
t = 0; if(argument_count > 4) t = argument[4];

temp = audio_play_sound(soundid, p, l);
audio_sound_gain(temp, v, t);
return temp;
