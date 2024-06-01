/// inventory_create_item(inv, string, [amount = 0], [x = -1], [y = -1])
{
    var inv, str, amount, xx, yy;
    inv = argument[0];
    str = argument[1];
    amount = 0; if(argument_count>2) amount = argument[2];
    xx = -1; if(argument_count>3) xx = argument[3];
    yy = -1; if(argument_count>4) yy = argument[4];
    var item_key = ds_map_size(inv);
    var item_map = ds_map_create();
    ds_map_add_map(inv, str, item_map);
    ds_map_add(item_map, "amount", amount);
    ds_map_add(item_map, "x", xx);
    ds_map_add(item_map, "y", yy);
}
