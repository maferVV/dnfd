/// so_sound_after_create(gain)
// makes changes to soundid after being created

var gain = argument0;

// get real radius and force
radius = 250;
force = 100;
// adjust sound gain based on distance from camera
var vol = audio_sound_get_gain(soundid);
var cam = objCamera;
var gain_change = clamp(map_value(point_distance(x, y, cam.x, cam.y), 0, radius, 1, 0), 0.25, 1);

vol = gain * gain_change;
audio_sound_gain(soundid, vol, 0);
