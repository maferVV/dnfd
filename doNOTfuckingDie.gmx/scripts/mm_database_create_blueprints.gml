/// mm_database_create_blueprints(chunkx, chunky)
// Creates map with instructions on how to build every object based on data on chunks,
// and saves it in a map [] that will become a json (which will be saved on disk)
{
    var chunk_blueprints, chunk, chunkx, chunky, key;
    chunkx = argument0; // chunk x offset
    chunky = argument1; // chunk y offset
    key = chunk_coords_to_key(string(chunkx), string(chunky));
    chunk = chunks[? key]
    chunk_blueprints = mm_database_get_chunk_blueprints(key);
    
    // Numbers for how to create blueprints
    var entity_index = 0;
    var tile_size_pixels = 8;
    var sea_level = 0.55;
    var beach_level = 0.65;
    var river_level = 0.049;
    var river_edge_level = 0.12;
    var funk_level = 0.6;
    for(var i = 0; i < chunk_size; i++)
    {
        for(var j = 0; j < chunk_size; j++)
        {
            var elevation_grid = chunk[? "elevation_grid"];
            var rivers_grid = chunk[? "rivers_grid"];
            var weird_grid = chunk[? "weird_grid"];
            var tile_height = elevation_grid[# i,j];
            var tile_rivers = abs( map_value(rivers_grid[# i,j], 0, 1, -1, 1) );
            var weirdness = weird_grid[# i,j];
            
            if(tile_height < sea_level)
            {
                // sea
                
            }
            else if(tile_height < beach_level)
            {
                // beach
                if(tile_rivers < river_level)
                {
                    // mangrove river
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objWaterColor);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", x+(i*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", y+(j*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "image_alpha", 0.6);
                    log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_yellow, c_maroon, 0.5));
                    entity_index++;
                    
                }
                else if(tile_rivers < river_edge_level)
                {
                    // mangrove land
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objRocks);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", x+(i*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", y+(j*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "stack_anim_array[0]", stackSand);
                    log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_white, c_maroon, 0.5));
                    entity_index++;
                    
                    if(weirdness > 0)
                    {
                        log_entity_metadata(chunk_blueprints, entity_index, "obj", objWalkerTreeBase);
                        log_entity_metadata(chunk_blueprints, entity_index, "x", x+(i*tile_size_pixels)+(tile_size_pixels/2));
                        log_entity_metadata(chunk_blueprints, entity_index, "y", y+(j*tile_size_pixels)+(tile_size_pixels/2));
                        entity_index++;
                    }
                }
                else
                {
                    // beach sand
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objRocks);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", x+(i*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", y+(j*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "stack_anim_array[0]", stackSand);
                    entity_index++;
                    
                }
            }
            else // forest
            {
                if(tile_rivers < river_level)
                {
                    // forest river
                    // mangrove river
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objWaterColor);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", x+(i*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", y+(j*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "image_alpha", 0.4);
                    log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_blue, c_aqua, 0.5));
                    entity_index++;
                }
                else if(tile_rivers < river_edge_level)
                {
                    // forest river edge
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objRocks);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", x+(i*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", y+(j*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "stack_anim_array[0]", stackGrass);
                    log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_white, c_green, 0.25));
                    entity_index++;
                }
                else
                {
                    // forest
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objRocks);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", x+(i*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", y+(j*tile_size_pixels)+(tile_size_pixels/2));
                    log_entity_metadata(chunk_blueprints, entity_index, "stack_anim_array[0]", stackGrass);
                    entity_index++;
                }
            }
        }
    
    }
}
