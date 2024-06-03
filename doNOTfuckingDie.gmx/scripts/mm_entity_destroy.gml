/// mm_entity_destroy()
// returns true is succesful
if(!instance_exists(instantiator)) return error("no instantiator", false);

var db = instantiator.db;
var key = mm_chunk_coords_to_key(chunk_x, chunk_y);
var chunk_blueprints = db.blueprints[? key];
// find my instance representation in blueprints
var my_blueprints = chunk_blueprints[? index];
// destroy blueprints so its saved in disc without me
ds_map_destroy(my_blueprints);
ds_map_delete(chunk_blueprints, index);

/// Destroy from instance list
var chunks_entities = instantiator.chunks_entities;
var chunk_entities = chunks_entities[? key];

