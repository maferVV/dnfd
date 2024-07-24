/// level depth and sea setup
depth_max = 1000;
depth_min = -1000;
sea = instance_singleton(objSeaFloorShader);
objSeaFloorShader.depth = 1000000;
objSeaFloorShader.vx1 = -10000;
objSeaFloorShader.vy1 = -10000;
objSeaFloorShader.vx2 = 10000;
objSeaFloorShader.vy2 = 10000;
strength_desired_set = 0;
lut_subimg_desired_set = 0;

/// set camera and player focus
cam = objCamera;
with(cam)
{
    state_switch(camFollow);
}
alarm[0] = 1;

/// day time manager
minutes_passed = 8*60//0; // 0-1440 minutes in a day
minute_spd = 2/60; // how many minutes increment per step?
// schedule events
prevHour = 0;
sunrise_hour = 6;
midday_hour = 12;
sunset_hour = 18;

/// Mappa Mundi
db = instance_create(x, y, objMMDatabase);
db.cam = self.cam;
instantiator = instance_create(x, y, objMMInstantiator);
instantiator.db = db;
db.instantiator = self.instantiator;
chunk_manager = instance_create(x, y, objMMChunkManager);
chunk_manager.db = db;
chunk_manager.cam = self.cam;
db.chunk_manager = self.chunk_manager;

// world bounds corners
var worldCenterX = room_width/2;
var worldCenterY = room_height/2;
bounds_x1 = worldCenterX-room_width/4;
bounds_y1 = worldCenterY-room_height/4;
bounds_x2 = worldCenterX+room_width/4;
bounds_y2 = worldCenterY+room_height/4;

/// create player
player = instance_create(0, 0, objWillow);

/// pathfinding 
pathfinding = instance_singleton(obj_pathfinding);


