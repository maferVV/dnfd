/// trawl_chunk_create_content()

var entity_index = 0;

// Fill weird_grid
var weird_min = 1;
var weird_max = 4;
var weird_cells = round(rand_buffer()*(weird_max-weird_min)+weird_min);
var weird_grid = ds_grid_create(width, height);
for(var i = 0; i < weird_cells; i++)
{
    var xx = floor(rand_buffer() * width);
    var yy = floor(rand_buffer() * height);
    
    weird_grid[# xx, yy] = 1;
}

var newSize = tileSize/sprite_get_width(stackRocks);
// go through grid
/*
for(var i = 0; i < width; i++)
{
    for(var j = 0; j < height; j++)
    {
        var value = elevation_grid[# i,j];
        var value2 = abs( map_value(rivers_grid[# i,j], 0, 1, -1, 1) );
        var x1 = x+(i*tileSize);
        var y1 = y+(j*tileSize);
        var obj = noone;
        var weirdness = weird_grid[# i,j];
        
        if(value < sea_level)
        {
            // sea
            
        }
        else if(value < beach_level)
        {
            // beach
            if(value2 < river_level)
            {
                // mangrove river
                log_entity_metadata(entity_index, "obj", objWaterColor);
                log_entity_metadata(entity_index, "x", x+(i*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "y", y+(j*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "newSize", newSize);
                log_entity_metadata(entity_index, "image_alpha", 0.6);
                log_entity_metadata(entity_index, "image_blend", merge_colour(c_yellow, c_maroon, 0.5));
                entity_index++;
                
            }
            else if(value2 < river_edge_level)
            {
                // mangrove land
                log_entity_metadata(entity_index, "obj", objRocks);
                log_entity_metadata(entity_index, "x", x+(i*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "y", y+(j*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "newSize", newSize);
                log_entity_metadata(entity_index, "stack_anim_array[0]", stackSand);
                log_entity_metadata(entity_index, "image_blend", merge_colour(c_white, c_maroon, 0.5));
                entity_index++;
                
                if(weirdness > 0)
                {
                    log_entity_metadata(entity_index, "obj", objWalkerTreeBase);
                    log_entity_metadata(entity_index, "x", x+(i*tileSize)+(tileSize/2));
                    log_entity_metadata(entity_index, "y", y+(j*tileSize)+(tileSize/2));
                    entity_index++;
                }
            }
            else
            {
                // beach sand
                log_entity_metadata(entity_index, "obj", objRocks);
                log_entity_metadata(entity_index, "x", x+(i*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "y", y+(j*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "newSize", newSize);
                log_entity_metadata(entity_index, "stack_anim_array[0]", stackSand);
                entity_index++;
                
            }
        }
        else // forest
        {
            if(value2 < river_level)
            {
                // forest river
                // mangrove river
                log_entity_metadata(entity_index, "obj", objWaterColor);
                log_entity_metadata(entity_index, "x", x+(i*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "y", y+(j*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "newSize", newSize);
                log_entity_metadata(entity_index, "image_alpha", 0.4);
                log_entity_metadata(entity_index, "image_blend", merge_colour(c_blue, c_aqua, 0.5));
                entity_index++;
            }
            else if(value2 < river_edge_level)
            {
                // forest river edge
                log_entity_metadata(entity_index, "obj", objRocks);
                log_entity_metadata(entity_index, "x", x+(i*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "y", y+(j*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "newSize", newSize);
                log_entity_metadata(entity_index, "stack_anim_array[0]", stackGrass);
                log_entity_metadata(entity_index, "image_blend", merge_colour(c_white, c_green, 0.25));
                entity_index++;
            }
            else
            {
                // forest
                log_entity_metadata(entity_index, "obj", objRocks);
                log_entity_metadata(entity_index, "x", x+(i*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "y", y+(j*tileSize)+(tileSize/2));
                log_entity_metadata(entity_index, "newSize", newSize);
                log_entity_metadata(entity_index, "stack_anim_array[0]", stackGrass);
                entity_index++;
            }
        }
    }

}

//print( ds_map_to_string(entity_metadata) );
//print("chunk metadata done")

ds_grid_destroy( weird_grid );
