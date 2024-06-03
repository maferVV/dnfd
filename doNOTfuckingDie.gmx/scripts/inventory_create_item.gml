/// inventory_create_item(inv, string, [x = rand], [y = rand])
{
    var inv, str, xx, yy;
    inv = argument[0];
    str = argument[1];
    xx = random_range(-1,1); if(argument_count>2) xx = argument[2];
    yy = random_range(-1,1); if(argument_count>3) yy = argument[3];
    var item_key = ds_map_size(inv);
    var item_map = ds_map_create();
    ds_map_add_map(inv, item_key, item_map);
    ds_map_add(item_map, "string", str);
    ds_map_add(item_map, "x", xx);
    ds_map_add(item_map, "y", yy);
}
