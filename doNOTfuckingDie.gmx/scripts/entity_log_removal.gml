/// entity_log_removal()
// When created in chunk_instantiate_entities(), entity is given
// the myEntityId value.
{
    var chunkcoords = get_chunk_coords_from_world_coords(x, y);
    log_entity_destroyed( chunkcoords[0], chunkcoords[1], myEntityId );
}
