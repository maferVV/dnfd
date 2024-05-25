/// mm_chunk_manager_render()
// renders inside culling area

if(!mm_chunk_get_culling_coords())
    return error("Incomplete references", false);
    
// Get chunk coords inside culling area.
var chunk_size_pixels = db.chunk_size * db.tile_size_pixels;
var potential_chunks_x = 0; // array
var potential_chunks_y = 0; // array
var potential_chunks_size = 0; // array iterator
for(var xx = floor(culling_x1/chunk_size_pixels); xx < ceil(culling_x4/chunk_size_pixels); xx++)
{
    for(var yy = floor(culling_y1/chunk_size_pixels); yy < ceil(culling_y4/chunk_size_pixels); yy++)
    {
        potential_chunks_x[potential_chunks_size] = xx;
        potential_chunks_y[potential_chunks_size] = yy;
        potential_chunks_size++;
    }
}

// for each chunk
for(var chunk_i = 0; chunk_i < array_length_1d(potential_chunks_x); chunk_i++)
{
    var chunk_x = potential_chunks_x[chunk_i];
    var chunk_y = potential_chunks_y[chunk_i];
    var chunk_key = mm_chunk_coords_to_key(chunk_x, chunk_y);
    var chunk_isVisible = false;
    var chunk_isActivated = false;
    var chunk_entities = chunks_entities[? chunk_key];
    if( !is_undefined(chunk_entities) )
    {
        chunk_isVisible = chunks_visibility[? chunk_key];
        chunk_isActivated = chunks_activated[? chunk_key];
    }
    if( !chunk_isVisible )
    {
        if( !chunk_isActivated )
        {
            if( is_undefined(chunk_entities) ) // If not instantiated
            {
                if( is_undefined(db.blueprints[? chunk_key]) )
                {
                    if( is_undefined(db.chunks[? chunk_key]) )
                    {
                        with(db){ mm_database_load_chunk(chunk_x, chunk_y); }
                    }
                    with(db){ mm_database_create_blueprints(chunk_x, chunk_y); }
                }
                with(instantiator){ mm_instantiator_instantiate_chunk(chunk_x, chunk_y); }
            }
            mm_chunk_manager_set_active(chunk_x, chunk_y, true);
        }
        mm_chunk_manager_set_visible(chunk_x, chunk_y, true);
    }
}

return true;
