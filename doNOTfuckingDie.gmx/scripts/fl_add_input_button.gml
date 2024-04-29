///fl_add_input_button(name,rel_x,rel_y,width,height,[input = -1],[gamepad = false])
/*
    Assigns an input button to an instance.
*/

var component = fl_field_init(obj_fl_input_button,argument[0],argument[1],argument[2],argument[3],argument[4]);

with(component) {
    if(argument_count > 5) {
        input = argument[5];
    }
    
    if(argument_count > 6) {
        gamepad = argument[6];
    }
}

return component;
