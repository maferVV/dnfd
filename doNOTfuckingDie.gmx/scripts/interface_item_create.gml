// refs
player_interface = noone; //my player interface
inventory_item = noone; //map
db = noone;

// vars 
index = 0; // my unique id
depth_offset = 0;
yoffset = 0;
xscale_offset = 0;
yscale_offset = 0;
angle_offset = 0;

// physics
tmc_dt_instance_init();
tmc_dt_set_friction(8);
dt_image_speed = 0;
is3D = false;
collision_type = bbox_type.simple;


