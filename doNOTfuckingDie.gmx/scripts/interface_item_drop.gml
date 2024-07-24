/// interface_item_drop()
// Drop item in the overworld.
// Assumes chunk is activated and visible.

var arr = drawgui_to_room(x, y);
var xx = arr[0];
var yy = arr[1];

// Get player coords
var player = player_interface.player;
var player_bbbox_bottom = 0; with(player){player_bbbox_bottom = decimal_bbox_bottom();}

var instance = item_generate_at(player.x, player_bbbox_bottom, inventory_item[? "string"]);

// Get player toss force and give the item a lil toss
var len = player.toss_spd;
var dir = point_direction(player.x, player_bbbox_bottom, xx, yy);
with(instance)
{
    toss_anim_state = 1;
    tmc_dt_motion_add(dir, len);
}
// Finally destroy inventory reference and destroy interface item instance
if(inventory_item == player.equiped)
    player.equiped = noone;
ds_map_destroy(inventory_item);
ds_list_delete(player_interface.inventory, index);
inventory_clean(player_interface.inventory);
instance_destroy();
