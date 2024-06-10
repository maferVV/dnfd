ready = false;
var ang = choose(45, 135, 225, 270) + gauss(0,10);
tmc_dt_motion_set(ang, toss_spd);
