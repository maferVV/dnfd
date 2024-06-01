stuck_sound = audio_play_soundy(choose(sndSlam1, sndSlam2, sndSlam3, sndSlam4, sndSlam5, sndSlap1), 1, false, 1, 1, x, y);
audio_sound_pitch(stuck_sound, random_range(0.98,1.02));
dt_alarm[0] = 6;
