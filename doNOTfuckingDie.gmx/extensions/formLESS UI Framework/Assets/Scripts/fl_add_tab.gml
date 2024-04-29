///fl_add_tab(name,rel_x,rel_y,width,height,[value],[group],[active])
/*
    Assigns a tab to an instance. You can specify a group (as string) if you want
    to link tabs together.
*/

var component = fl_field_init(obj_fl_tab,argument[0],argument[1],argument[2],argument[3],argument[4]);

with(component) {
    if(argument_count > 5) {
        value = argument[5];
    }
    if(argument_count > 6) {
        group = argument[6];
    }
    if(argument_count > 7) {
        active = argument[7];
    }
}

return component;