/// obstacle_set_ravaged( obstacleid, set? )
{
    var obstacle = argument0;
    var new_ravaged = argument1;
    with(obstacle)
    {
        is_ravaged = new_ravaged;
        if(is_ravaged)
        {
            if(instance_exists(my_solid))
                instance_destroy(my_solid);
            dt_image_index = 1;
            interactable = false;
        }
        else
        {
            if(!instance_exists(my_solid))
                my_solid = instance_create(terrace_down(x, objMMDatabase.tile_size_pixels), terrace_down(y, objMMDatabase.tile_size_pixels), objMMObstacleSolid);
            my_solid.can_interact_through = true;
            if(debug)
            {
                with(my_solid)
                {
                    set_depth( -y -100);
                    visible = true;
                }
            }
            dt_image_index = 0;
        }
    }
}
