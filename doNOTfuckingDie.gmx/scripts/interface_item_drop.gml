/// interface_item_drop()
// Drop item in the overworld.
// Assumes chunk is activated and visible.

var arr = drawgui_to_room(x, y);
var xx = arr[0];
var yy = arr[1];

// Get player coords
var player = player_interface.player;
var player_bbbox_bottom = 0; with(player){player_bbbox_bottom = decimal_bbox_bottom();}

// Get room chunk for room [x,y]
var db = interface_item_find_db();
var chunk_size_pixels = db.chunk_size * db.tile_size_pixels;
var chunk_x = floor(xx/chunk_size_pixels);
var chunk_y = floor(yy/chunk_size_pixels);
var chunk_key = mm_chunk_coords_to_key(chunk_x, chunk_y);
// Create blueprint first with the info we need
var blueprints = db.blueprints;
var chunk_blueprints = blueprints[? chunk_key];
var entity_index = ds_map_size(chunk_blueprints)-1;
do
{
    entity_index++;
}
until( !ds_map_exists(chunk_blueprints, entity_index) )
var item_name = inventory_item[? "string"];
with(db)
{
    mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objOverworldItem);
    mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", player.x);
    mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", player_bbbox_bottom);
    mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "item_name", item_name);
}
// Then instantiate blueprint
var instantiator = db.instantiator;
with(instantiator)
{
    var chunk_entities = chunks_entities[? chunk_key];
    var entity_blueprints = chunk_blueprints[? entity_index];
    var instance = mm_instantiator_instantiate_entity(chunk_entities, entity_blueprints, entity_index, chunk_x, chunk_y, true, true);
}
// Get player toss force and give the item a lil toss
var len = player.toss_spd;
var dir = point_direction(player.x, player_bbbox_bottom, xx, yy);
with(instance)
{
    toss_anim_state = 1;
    tmc_dt_motion_add(dir, len);
}
// Finally destroy inventory reference and destroy interface item instance
ds_map_delete(player_interface.inventory, index);
ds_map_destroy(inventory_item);
instance_destroy();
