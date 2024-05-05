/// chunk_blueprint_exists(chunk_x, chunk_y)
// returns true if there exists blueprint data for a given chunk
{
    var chunk_x, chunk_y, key;
    chunk_x = argument0;
    chunk_y = argument1;
    key = chunk_coords_to_key(chunk_x, chunk_y);
    return !is_undefined(blueprints[? key]);
}
