/// mm_chunk_manager_create();
// manages which chunks are to be drawn on screen

// references
db = noone;
cam = noone;
chunks_entities = noone; //reference to instantiator.chunks_entities

// properties
culling_x1 = 0; culling_y1 = 0;
culling_x4 = 0; culling_y4 = 0;

// alarms
tmc_dt_alarm_init();
alarm0_cooldown = 1*room_speed;
alarm1_cooldown = 3*room_speed;
dt_alarm[0] = 1;
dt_alarm[1] = alarm1_cooldown/2;
