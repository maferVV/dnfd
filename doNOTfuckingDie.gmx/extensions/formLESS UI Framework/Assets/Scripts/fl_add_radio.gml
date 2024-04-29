///fl_add_radio(name,rel_x,rel_y,width,height,[value],[group],[checked])
/*
    Assigns a radio button to an instance. To link radio buttons, you need to specify
    the same group (as string).
*/

var component = fl_field_init(obj_fl_radio,argument[0],argument[1],argument[2],argument[3],argument[4]);

with(component) {
    if(argument_count > 5) {
        value = argument[5];
    }
    if(argument_count > 6) {
        group = argument[6];
    }
    if(argument_count > 7) {
        checked = argument[7];
    }
}

return component;