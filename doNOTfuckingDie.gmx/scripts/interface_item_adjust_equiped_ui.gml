/// interface_item_adjust_equiped_ui()

var player = player_interface.player;
if(inventory_item == player.equiped)
{
    player_interface.equiped_y = y;
    player_interface.inventory_item_equiped = self.id;
}
