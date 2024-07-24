/// obstacle_interact(player)
{
    var player = argument0;
    if(!is_ravaged)
    {
        var player_interface = player.inventory_manager;
        with(player_interface)
        {
            can_skip_check = true;
            check_number = other.check_number;
            check_name = other.check_name;
            script_success = nest_dig;
            script_success_args[0] = other.id;
            script_failure = noone;
            script_failure_args = 0; //array
            state_switch("toDiceCheck");
        }
    }
}
