/// mm_chunk_get_culling_coords()

if( !instance_exists(cam) )
    return 0;
if( !instance_exists(db) )
    return 0;
var instantiator = db.instantiator;
if( !instance_exists(instantiator) )
    return 0;
chunks_entities = instantiator.chunks_entities;

// references asserted
// Create culling area based on camera x,y and *supposed* zoom.
var ideal_wview = objDisplayManager.ideal_width / cam.zoom_default;
var ideal_hview = objDisplayManager.ideal_height/ cam.zoom_default;
var culling_multiplier1 = 1.5;
culling_x1 = cam.x-ideal_wview/2*culling_multiplier1;
culling_y1 = cam.y-ideal_hview/2*culling_multiplier1;

culling_x4 = cam.x+ideal_wview/2*culling_multiplier1;
culling_y4 = cam.y+ideal_hview/2*culling_multiplier1;
