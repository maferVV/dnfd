/// add_chunk(x, y)
var chunk, xx, yy, key;
xx = argument0;
yy = argument1;
key = string(xx)+","+string(yy);

if( !ds_map_exists(chunks, key) )
{
    chunk = instance_create(0+(xx*chunk_width),0+(yy*chunk_height),objPerlinChunk);
    with(chunk)
    {
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
        generate_perlin_chunk(other.chunk_octaves,other.chunk_persistence,
                        other.chunk_wavelength_modifier,other.chunk_lacunarity,
                        other.chunk_is_island,other.chunk_is_refined);
    }
    ds_map_add(chunks, key, chunk);
    return true;
}

return false;
