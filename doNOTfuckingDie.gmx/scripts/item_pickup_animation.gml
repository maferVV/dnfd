/// item_pickup_animation(x, y, item_name, inventory_manager)
{
    var xx, yy, item_name, inventory_manager;
    xx = argument0;
    yy = argument1;
    item_name = argument2;
    inventory_manager = argument3;
    
    var arr = room_to_drawgui(xx, yy);
    var p = instance_create(arr[0], arr[1], objItemPickupParticle);
    p.sprite_index = item_name_to_sprite(item_name);
    p.inventory_manager = inventory_manager;
}
