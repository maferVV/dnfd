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
    var chunk_size_pixels = self.tile_size_pixels * chunk_size;
    var xx = chunkx * chunk_size_pixels; //chunk_x_in_room
    var yy = chunky * chunk_size_pixels; //chunk_y_in_room
    var entity_index = 0;
    for(var i = 0; i < chunk_size; i++)
    {
        for(var j = 0; j < chunk_size; j++)
        {
            var elevation_grid = chunk[? "elevation_grid"];
            var elevation = abs(map_value(elevation_grid[# i,j],0,1,-1,1));
            var precipitation_grid = chunk[? "precipitation_grid"];
            var precipitation = precipitation_grid[# i,j]
            var temperature_grid = chunk[? "temperature_grid"];
            var temperature = temperature_grid[# i,j]
            var rand_grid = chunk[? "rand_grid"];
            var rand_val = rand_grid[# i,j];
            var biome = determine_biome(precipitation, temperature);
            
            if(false) //debuging
            {
                var n = terrace_down(temperature, 1/2);
                //if(n > 0.1) n = 1;
                var dstr =  "val: "+string(n);
                mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_black, c_white, n));
                mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", dstr);
                entity_index++;
            }
            else
            {
                if( biome == "manglar" )
                {
                    if(elevation < 0.07)        // Water
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_yellow, c_blue, 0.1));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_alpha", 0.2);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Manglar Water");
                        entity_index++;
                    }
                    else if(elevation < 0.15)  // Manglar Trees
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_maroon, c_dkgray, 0.5));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Manglar Trees");
                        entity_index++;
                        if(rand_val < 0.8)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugSolid);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                            entity_index++;
                        }
                        
                    }
                    else if(elevation < 0.25)   // Beach
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_white, c_yellow, 0.25));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Manglar Beach");
                        entity_index++;
                    }
                    else if(elevation < 0.4)   // Mud
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(merge_colour(c_maroon, c_green, 0.4), merge_colour(c_green, c_dkgray, 0.7), 0.9));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Manglar Muddy Forest");
                        entity_index++;
                    }
                    else if(elevation < 0.55)   // Solid forest
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_white, c_green, 0.7));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Manglar Solid Forest");
                        entity_index++;
                        if(rand_val < 0.3)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objObstacle);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "roll_check", 7);
                            entity_index++;
                        }
                        else if(rand_val < 0.55)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objObstacle);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "sprite_index", choose(sprObstacleSmall1, sprObstacleSmall2 ));
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "roll_check", 9);
                            entity_index++;
                        }
                        else if(rand_val < 0.58)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objOverworldItem);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "item_name", "pebble");
                            entity_index++;
                        }
                        else if(rand_val < 0.59)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objOverworldItem);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "item_name", "stick");
                            entity_index++;
                        }
                    }
                    else if(elevation < 0.59)   // Hidden Grotto Edge
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_green, c_dkgray, 0.8));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Manglar Hidden Grotto Edge");
                        entity_index++;
                        if(rand_val < 0.99)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugSolid);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                            entity_index++;
                        }
                    }
                    else                        // Hidden Grotto
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_green, c_dkgray, 0.5));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Manglar Hidden Grotto");
                        entity_index++;
                        if(rand_val < 0.3)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugSolid);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                            entity_index++;
                        }
                    }
                }
                else if(biome == "rainforest")
                {
                    if(elevation < 0.09)        // Water
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", c_blue);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_alpha", 0.2);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Forest Water");
                        entity_index++;
                    }
                    else if(elevation < 0.17)  // Beach
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_white, c_yellow, 0.25));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Forest Beach");
                        entity_index++;
                    }
                    else if(elevation < 0.3)   // Grass
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_white, c_green, 0.6));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Forest Grass");
                        entity_index++;
                    }
                    else if(elevation < 0.55)   // Solid forest
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_white, c_green, 0.7));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Solid Forest");
                        entity_index++;
                        if(rand_val < 0.3)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objObstacle);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "roll_check", 7);
                            entity_index++;
                        }
                        else if(rand_val < 0.55)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objObstacle);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "sprite_index", choose(sprObstacleSmall1, sprObstacleSmall2 ));
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "roll_check", 9);
                            entity_index++;
                        }
                        else if(rand_val < 0.58)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objOverworldItem);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "item_name", "pebble");
                            entity_index++;
                        }
                        else if(rand_val < 0.59)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objOverworldItem);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels)+tile_size_pixels/2);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "item_name", "stick");
                            entity_index++;
                        }
                    }
                    else if(elevation < 0.59)   // Hidden Grotto Edge
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_green, c_dkgray, 0.8));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Hidden Grotto Edge");
                        entity_index++;
                        if(rand_val < 0.99)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugSolid);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                            entity_index++;
                        }
                    }
                    else                        // Hidden Grotto
                    {
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugTile);
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "image_blend", merge_colour(c_green, c_dkgray, 0.5));
                        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "debug_string", "Hidden Grotto");
                        entity_index++;
                        if(rand_val < 0.3)
                        {
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objMMDebugSolid);
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx+(i*tile_size_pixels));
                            mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy+(j*tile_size_pixels));
                            entity_index++;
                        }
                    }
                    
                }
            }
        }//for
    
    }//for
    
    return true;
}
