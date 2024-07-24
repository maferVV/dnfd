event_inherited();

interactable = false;
interact_script = obstacle_interact;
dt_image_speed = 0;
my_solid = noone;
is_ravaged = false;
check_number = 7; 
check_name = "Remove Medium Obstacle";
sprite_index = sprObstacleMedium1;
set_depth( -y -1 );
alarm[0] = 1;

debug = false&&global.debug;
