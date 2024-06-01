/// inventory_load()
// crteates a new ds_map or load from disc
// todo: load from disc
{
    var inv = ds_map_create();
    inventory_create_item(inv, "pebble");
    inventory_create_item(inv, "stick");
    return inv;
}
