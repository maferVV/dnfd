/// mm_chunk_manager_derender()

if(!mm_chunk_get_culling_coords())
    return error("Incomplete references", false);

// get all visible chunks in a list(grid)
var managed_chunks_keys = 0; //list
var list_index = 0;
var chunk_size_pixels = db.chunk_size * db.tile_size_pixels;

for(var k = ds_map_find_first(chunks_activated); !is_undefined(k); k = ds_map_find_next(chunks_activated, k))
{
    var arr = mm_key_to_coords(k);
    var xx_in_room = real(arr[0])*chunk_size_pixels;
    var yy_in_room = real(arr[1])*chunk_size_pixels;
    var overlap = rectangle_in_rectangle(xx_in_room,
                                            yy_in_room,
                                            xx_in_room+chunk_size_pixels,
                                            yy_in_room+chunk_size_pixels,
                                            culling_x1,
                                            culling_y1,
                                            culling_x4,
                                            culling_y4);
    var chunk_isVisible = false;
    var chunk_isActivated = false;
    var chunk_entities = chunks_entities[? k];
    if( !is_undefined(chunk_entities) )
    {
        chunk_isVisible = chunks_visibility[? k];
        chunk_isActivated = chunks_activated[? k];
    }
    
    if( (overlap==0) && (chunk_isVisible) && (chunk_isActivated) )
    {
        managed_chunks_keys[list_index] = string(k);
        list_index++;
    }
}

array_print(managed_chunks_keys);

if(list_index <= 0) return 0;

// Grid's 2 columns: key, distance to cam
var w = 2;
var h = list_index; // fill with amount of chunks

// reset grid
ds_grid_clear(grid, 0);
ds_grid_resize(grid, 2, h);

// Get distance value and assign to grid
for(var i = 0; i < h; i++)
{
    var key = managed_chunks_keys[i];
    ds_grid_set(grid, 0, i, key);
    var arr = mm_key_to_coords(key);
    var xx = real(arr[0]);
    var yy = real(arr[1]);
    var cam_chunk_x = floor(cam.x/chunk_size_pixels);
    var cam_chunk_y = floor(cam.y/chunk_size_pixels);
    var dist = point_distance(xx, yy, cam_chunk_x, cam_chunk_y);
    ds_grid_set(grid, 1, i, dist);
}

/// sort chunk by farthest to camera
// sort based on distance column
ds_grid_sort(grid, 1, false);

ds_grid_print(grid);
// derender the farthest n chunks 
var n = floor(h/2);
var _max = min(h, n);
for(var i = 0; i < _max; i++)
{
    var chunk_key = grid[# 0, i];
    var arr = mm_key_to_coords(chunk_key);
    var xx = real(arr[0]);
    var yy = real(arr[1]);
    
    var chunk_isVisible = false;
    var chunk_isActivated = false;
    var chunk_entities = chunks_entities[? chunk_key];
    if( !is_undefined(chunk_entities) )
    {
        chunk_isVisible = chunks_visibility[? chunk_key];
        chunk_isActivated = chunks_activated[? chunk_key];
    }
    
    if(chunk_isActivated)
    {
        if(chunk_isVisible)
        {
            mm_chunk_manager_set_visible(xx, yy, false);
        }
        mm_chunk_manager_set_active(xx, yy, false);
    }
    
}

return true;
