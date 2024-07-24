/// inventory_clean( inv )
{
    var inv = argument0;
    var i = 0;
    while(i < ds_list_size(inv))
    {
        if( !ds_exists(inv[| i], ds_type_map) )
            ds_list_delete(inv, i);
        else
            i++;
    }
}
