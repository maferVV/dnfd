///fl_add_checkbox(name,rel_x,rel_y,width,height,[value],[checked])
/*
    Assigns a checkbox to an instance. checked represents the initial state of the
    checkbox, and can be true or false.
*/

var component = fl_field_init(obj_fl_checkbox,argument[0],argument[1],argument[2],argument[3],argument[4]);

with(component) {
    if(argument_count > 5) {
        value = argument[5];
    }
    if(argument_count > 6) {
        checked = argument[6];
    }
}

return component;
