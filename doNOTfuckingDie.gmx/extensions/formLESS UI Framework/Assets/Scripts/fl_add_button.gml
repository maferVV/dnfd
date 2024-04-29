///fl_add_button(name,rel_x,rel_y,width,height,[value])
/*
    Assigns a button to an instance.
*/

var component = fl_field_init(obj_fl_button,argument[0],argument[1],argument[2],argument[3],argument[4]);

with(component) {
    if(argument_count > 5) {
        value = argument[5];
    }
}

return component;