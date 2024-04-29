///fl_add_list(name,rel_x,rel_y,width,height,[options_list],[selected_index])
/*
    Assigns a list field to an instance.
    options_list is a ds_list of options, selected_index is index of the starting value
    in the options list.
*/

var component = fl_field_init(obj_fl_list,argument[0],argument[1],argument[2],argument[3],argument[4]);

with(component) {
    if(argument_count > 5) {
        options = argument[5];
    }
    if(argument_count > 6) {
        index = argument[6];
    }
    
    event_user(2);
}

return component;
