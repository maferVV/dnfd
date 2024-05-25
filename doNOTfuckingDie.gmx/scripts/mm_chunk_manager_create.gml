/// mm_chunk_manager_create();
// manages which chunks are to be drawn on screen

// references
db = noone;
cam = noone;
instantiator = noone;
chunks_entities = noone; //reference to instantiator.chunks_entities

// properties
culling_x1 = 0; culling_y1 = 0;
culling_x4 = 0; culling_y4 = 0;
grid = ds_grid_create(0,0);
chunks_activated = ds_map_create();
chunks_visibility = ds_map_create();

// alarms
tmc_dt_alarm_init();
alarm0_cooldown = 0.4*room_speed;
alarm1_cooldown = 3*room_speed;
dt_alarm[0] = 1;
dt_alarm[1] = alarm1_cooldown/2;
depth = -100000000;
