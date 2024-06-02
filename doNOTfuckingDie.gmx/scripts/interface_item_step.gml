

tmc_dt_step_push_away(objPlayerInterfaceItem);
depth = depth_offset - y;

/// Manage appereance for cursor
if(player_interface.cursor_hover == id)
{
    if(player_interface.cursor_hold == id)
    {
        xscale_offset = image_xscale*0.2;
        yscale_offset = image_yscale*0.2;
    }
    else
    {
        xscale_offset = 0;
        yscale_offset = 0;
    }
    dt_image_index = 1;
}
else
{
    dt_image_index = 0;
}

/// Manage outside inventory space
if( !position_meeting(x-player_interface.backpack_xoffset,
                        y-player_interface.backpack_yoffset,
                        player_interface) )
    angle_offset += 10*global.delta_step;
else
    angle_offset = 0;

tmc_dt_step_full();
