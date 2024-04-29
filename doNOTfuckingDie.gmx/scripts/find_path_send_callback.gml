/// find_path_send_callback(start_x, start_y, end_x, end_y, object_id)
/// Objects will get a callback and they can pull out the path they need 
{

    gml_pragma("forceinline");
    
    if (argument4 != -1)
    {
        if (instance_exists(argument4))
        {
            if (argument0 == argument4.wasat_x and argument1 == argument4.wasat_y and argument2 == argument4.goto_x and argument3 == argument4.goto_y)
            {
                with(argument4) {event_user(10)}
            }
        }
    }


}

