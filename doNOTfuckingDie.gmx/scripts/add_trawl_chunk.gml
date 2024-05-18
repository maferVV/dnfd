/// add_trawl_chunk(x, y)
var chunk, xx, yy, key;
xx = argument0;
yy = argument1;
key = string(xx)+","+string(yy);


if( !ds_map_exists(chunks, key) && chunk_in_range(xx, yy) )
{
    chunk = instance_create(0+(xx*chunk_width),0+(yy*chunk_height),objTrawlChunk);
    with(chunk)
    {
        myManager = other.id;
        seed = other.seed;
        tile_map = other.tile_map;
        
        tileSize = other.chunk_tileSize;
        width = other.chunk_size;
        height = other.chunk_size;
        image_xscale = other.chunk_width;
        image_yscale = other.chunk_height;
        depth = other.depth;
        xoffset = xx;
        yoffset = yy;
        
        
        
        seed = other.seed;
        elevation_grid = generate_trawl_chunk(8,
                                            0.666,
                                            0.5,
                                            1.2042,
                                            false,
                                            false);
        seed = other.seed + 666;
        rivers_grid = generate_trawl_chunk(4,
                                            0.666,
                                            0.43,
                                            1.2042,
                                            false,
                                            false);
        
        random_set_seed( hash_function3(seed, xoffset, yoffset) );
        fill_rand_buffer();
        trawl_chunk_create_content();
        chunk_apply_entity_deltas();
        chunk_instantiate_entities();
    }
    ds_map_add(chunks, key, chunk);
    return true;
}

return false;
