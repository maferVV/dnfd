/// autounload_chunks()
// returns 0 if succesful in chunk deletion
/*
// count chunk candidates based on camera corner points
var cam = objCamera;
if(!instance_exists(cam)) return error("no cam", 1);
var cam_chunk_x = floor(cam.x/chunk_width);
var cam_chunk_y = floor(cam.y/chunk_height);
//
var left = min(cam.unload_culling_x1, cam.unload_culling_x2, cam.unload_culling_x3, cam.unload_culling_x4);
var right = max(cam.unload_culling_x1, cam.unload_culling_x2, cam.unload_culling_x3, cam.unload_culling_x4);
var top = min(cam.unload_culling_y1, cam.unload_culling_y2, cam.unload_culling_y3, cam.unload_culling_y4);
var bottom = max(cam.unload_culling_y1, cam.unload_culling_y2, cam.unload_culling_y3, cam.unload_culling_y4);
//
var loaded_chunks_x = 0; // array
var loaded_chunks_y = 0; // array

/// FIX: 4 areas means big overlap in the boxes diagonal to
/// the unload culling corners.

// fill area 1 (top)
for(var xx = 0; xx < ceil(room_width/chunk_width); xx++)
{
    for(var yy = 0; yy < floor(top/chunk_height); yy++)
    {
        // xx and yy mean the chunk x and y we should check for
        key = chunk_coords_to_key(xx, yy);
        if(ds_map_exists(chunks, key))
        {
            // unloaded chunk. Add to list
            var size = array_length_1d(loaded_chunks_x);
            loaded_chunks_x[size] = xx;
            loaded_chunks_y[size] = yy;
        }
    }
}
// fill area 2 (bottom)
for(var xx = 0; xx < ceil(room_width/chunk_width); xx++)
{
    for(var yy = ceil(bottom/chunk_height); yy < ceil(room_height/chunk_height); yy++)
    {
        // xx and yy mean the chunk x and y we should check for
        key = chunk_coords_to_key(xx, yy);
        if(ds_map_exists(chunks, key))
        {
            // unloaded chunk. Add to list
            var size = array_length_1d(loaded_chunks_x);
            loaded_chunks_x[size] = xx;
            loaded_chunks_y[size] = yy;
        }
    }
}
// fill area 3 (left)
for(var xx = 0; xx < floor(left/chunk_width); xx++)
{
    for(var yy = 0; yy < ceil(room_height/chunk_height); yy++)
    {
        // xx and yy mean the chunk x and y we should check for
        key = chunk_coords_to_key(xx, yy);
        if(ds_map_exists(chunks, key))
        {
            // unloaded chunk. Add to list
            var size = array_length_1d(loaded_chunks_x);
            loaded_chunks_x[size] = xx;
            loaded_chunks_y[size] = yy;
        }
    }
}
// fill area 4 (right)
for(var xx = ceil(right/chunk_width); xx < floor(room_width/chunk_width); xx++)
{
    for(var yy = 0; yy < ceil(room_height/chunk_height); yy++)
    {
        // xx and yy mean the chunk x and y we should check for
        key = chunk_coords_to_key(xx, yy);
        if(ds_map_exists(chunks, key))
        {
            // unloaded chunk. Add to list
            var size = array_length_1d(loaded_chunks_x);
            loaded_chunks_x[size] = xx;
            loaded_chunks_y[size] = yy;
        }
    }
}

/// RIGHT NOW: loaded_chunks_x/y are filled with all chunks
///             outside culling area that exist (and should be unloaded)

// Resize grid 3 columns: chunkx, chunky, distance to cam
var w = 3; // 3 columns
var h = array_length_1d(loaded_chunks_x); // fill with amount of chunks
// Reset grid
ds_grid_clear(loaded_chunks_grid, 0);
ds_grid_resize(loaded_chunks_grid, 3, h);

// Fill grid
for(var i = 0; i < h; i++)
{
    var xx = loaded_chunks_x[i];
    var yy = loaded_chunks_y[i];
    ds_grid_set(loaded_chunks_grid, 0, i, xx);
    ds_grid_set(loaded_chunks_grid, 1, i, yy);
    ds_grid_set(loaded_chunks_grid, 2, i, point_distance(xx, yy, cam_chunk_x, cam_chunk_y));
}

/// sort chunk by FARTHEST to camera
// sort based on distance column
ds_grid_sort(loaded_chunks_grid, 2, false);

var chunksToLoad = min(max_chunks_per_unload, ds_grid_height(loaded_chunks_grid));
/// unload (delete) the first n chunks
for(var i = 0; i < chunksToLoad; i++)
{
    var xx = ds_grid_get(loaded_chunks_grid, 0, i);
    var yy = ds_grid_get(loaded_chunks_grid, 1, i);
    attempt_delete_chunk(xx, yy);
}

return 0;
