/// autoload_chunks()
// returns 0 if succesful in chunk creation
/*
// count chunk candidates based on camera corner points
var cam = objCamera;
if(!instance_exists(cam)) return error("no cam", 1);
var cam_chunk_x = floor(cam.x/chunk_width);
var cam_chunk_y = floor(cam.y/chunk_height);
/// collect all candidate UNLOADED chunks to load inside view
// get a non distorted rect area
var left = min(cam.outside_culling_x1, cam.outside_culling_x2, cam.outside_culling_x3, cam.outside_culling_x4);
var right = max(cam.outside_culling_x1, cam.outside_culling_x2, cam.outside_culling_x3, cam.outside_culling_x4);
var top = min(cam.outside_culling_y1, cam.outside_culling_y2, cam.outside_culling_y3, cam.outside_culling_y4);
var bottom = max(cam.outside_culling_y1, cam.outside_culling_y2, cam.outside_culling_y3, cam.outside_culling_y4);
/// saving into arrays
var unloaded_chunks_x = 0; // array
var unloaded_chunks_y = 0; // array
// navigate all possible chunks in the area
for(var xx = floor(left/chunk_width); xx < ceil(right/chunk_width); xx++)
{
    for(var yy = floor(top/chunk_height); yy < ceil(bottom/chunk_height); yy++)
    {
        // xx and yy mean the chunk x and y we should check for
        key = chunk_coords_to_key(xx, yy);
        if(!ds_map_exists(chunks, key) && chunk_in_range(xx, yy))
        {
            // unloaded (and valid) chunk. Add to list
            var size = array_length_1d(unloaded_chunks_x);
            unloaded_chunks_x[size] = xx;
            unloaded_chunks_y[size] = yy;
        }
    }
}

if(array_length_1d(unloaded_chunks_x) <= 0)
    return 2; // no unloaded chunk candidates available

// create grid 3 columns: chunkx, chunky, distance to cam
var w = 3; // 3 columns
var h = array_length_1d(unloaded_chunks_x); // fill with amount of chunks available

// reset grid
ds_grid_clear(unloaded_chunks_grid, 0);
ds_grid_resize(unloaded_chunks_grid, 3, h);

for(var i = 0; i < h; i++)
{
    var xx = unloaded_chunks_x[i];
    var yy = unloaded_chunks_y[i];
    ds_grid_set(unloaded_chunks_grid, 0, i, xx);
    ds_grid_set(unloaded_chunks_grid, 1, i, yy);
    ds_grid_set(unloaded_chunks_grid, 2, i, point_distance(xx, yy, cam_chunk_x, cam_chunk_y));
}

/// sort chunk by closest to camera
// sort based on distance column
ds_grid_sort(unloaded_chunks_grid, 2, true);

var chunksToLoad = min(max_chunks_per_load, ds_grid_height(unloaded_chunks_grid));
/// load the first n chunks
for(var i = 0; i < chunksToLoad; i++)
{
    var xx = ds_grid_get(unloaded_chunks_grid, 0, i);
    var yy = ds_grid_get(unloaded_chunks_grid, 1, i);
    add_trawl_chunk(xx, yy);
}

return 0;
