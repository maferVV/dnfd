///fl_add_scrollbar(name,rel_x,rel_y,width,height,[start_value],[horizontal],[size])
/*
    Assigns a scrollbar to an instance. 
    start_value is a number between 0 and 1 that represents the initial position of the bar.
    You can specify a size for the scrollbar handle as a number between 0 and 1 (with 1 being
    the total width/height of the scrollbar).
*/

var component = fl_field_init(obj_fl_scrollbar,argument[0],argument[1],argument[2],argument[3],argument[4]);

with(component) {
    if(argument_count > 5) {
        value = argument[5];
    }
    if(argument_count > 6) {
        horizontal = argument[6];
    }
    if(argument_count > 7) {
        size = argument[7];
    }
    handle = fl_field_init(obj_fl_scrollbar_handle,name+"_handle",0,0,width,height);

    event_user(2);
}

return component;