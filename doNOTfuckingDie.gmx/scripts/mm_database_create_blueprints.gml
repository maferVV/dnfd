/// mm_database_create_blueprints(chunkx, chunky)
// Creates map with instructions on how to build every object based on data on chunks,
// and saves it in a map [] that will become a json (which will be saved on disk)
{
    var chunk_blueprints, chunk, chunkx, chunky, key;
    chunkx = argument0; // chunk x offset
    chunky = argument1; // chunk y offsetchunk_size
    key = mm_chunk_coords_to_key(chunkx, chunky);
    chunk = chunks[? key]
    chunk_blueprints = blueprints[? key];
    if( is_undefined(chunk_blueprints) ) // expected outcome
    {
        chunk_blueprints = ds_map_create();
        ds_map_add_map(blueprints, key, chunk_blueprints);
    }
    else
        return error("chunk blueprints already exists", false);
    
    // Numbers for how to create blueprints
    print_vars("chunk_size", self.chunk_size, "tile_size_pixels", self.tile_size_pixels);
    var chunk_size_pixels = self.tile_size_pixels * chunk_size;
    var xx = chunkx * chunk_size_pixels; //chunk_x_in_room
    var yy = chunky * chunk_size_pixels; //chunk_y_in_room
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
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMTile);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "sprite_index", spr_water_2dig);
                    log_entity_metadata(chunk_blueprints, entity_index, "image_alpha", 0.6);
                    log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_yellow, c_maroon, 0.5));
                    entity_index++;
                    
                }
                else if(tile_rivers < river_edge_level)
                {
                    // mangrove land
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMTile);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "sprite_index", spr_sand_2dig);
                    log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_white, c_maroon, 0.5));
                    entity_index++;
                    
                    if(weirdness > 0)
                    {
                        /*
                        log_entity_metadata(chunk_blueprints, entity_index, "obj", objWalkerTreeBase);
                        log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        entity_index++;
                        */
                    }
                }
                else
                {
                    // beach sand
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMTile);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "sprite_index", spr_sand_2dig);
                    entity_index++;
                    
                }
            }
            else // forest
            {
                if(tile_rivers < river_level)
                {
                    // forest river
                    // mangrove river
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMTile);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "sprite_index", spr_water_2dig);
                    log_entity_metadata(chunk_blueprints, entity_index, "image_alpha", 0.4);
                    log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_blue, c_aqua, 0.5));
                    entity_index++;
                }
                else if(tile_rivers < river_edge_level)
                {
                    // forest river edge
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMTile);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "sprite_index", spr_grass_2dig);
                    log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_white, c_green, 0.25));
                    entity_index++;
                }
                else
                {
                    // forest
                    log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMTile);
                    log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                    log_entity_metadata(chunk_blueprints, entity_index, "sprite_index", spr_grass_2dig);
                    entity_index++;
                }
            }
        }//for
    
    }//for
    
    return true;
}
