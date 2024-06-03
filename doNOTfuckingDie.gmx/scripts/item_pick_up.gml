/// item_pick_up( player )
{
    var player = argument0;
    // add item to inventory
    with(player)
    {
        inventory_create_item(inventory, other.item_name);
    }
    item_pickup_animation(x, y, item_name, player.inventory_manager);
    instance_destroy();
}
