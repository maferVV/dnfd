/// mm_chunk_manager_render_culling_area()

mm_chunk_get_culling_coords();

if( !instance_exists(db) )
    return 0;
var instantiator = db.instantiator;
if( !instance_exists(instantiator) )
    return 0;
chunks_entities = instantiator.chunks_entities;

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
    var chunk_blueprints = chunks_entities[? chunk_key];
    if( !is_undefined(chunk_blueprints) )
    {
        var chunk_isVisible = chunk_blueprints[? "isVisible"];
    }
    if( !chunk_isVisible )
    {
        if( is_undefined(chunk_blueprints) )
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
        mm_chunk_manager_set_visible(chunk_x, chunk_y, true);
    }
}
