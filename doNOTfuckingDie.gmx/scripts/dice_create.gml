// vars
player_interface = noone;
rolling = true;
value = 1; //1-6
face_index = 0;
face_xoffset = 0;
face_yoffset = 0;
face_angle = 0;
face_xscale = 1;
face_yscale = 1;

value_index = 0;
value_xoffset = 0;
value_yoffset = 0;
value_angle = 0;
value_xscale = 1;
value_yscale = 1;

ready = false;

tmc_dt_instance_init();
canBounceH = true;
canBounceV = true;
bounceCooldown = 5;
toss_spd = 1500;
tmc_dt_set_friction(20);
sprite_index = sprDiceValue;
dt_image_speed = 9/60;
dt_image_index = random(5);
