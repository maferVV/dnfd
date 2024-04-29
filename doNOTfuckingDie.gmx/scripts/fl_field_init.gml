///fl_field_init(component_obj,name,rel_x,rel_y,widht,height)
/*
    INTERNAL USE ONLY.
    Initializes common component attributes.
*/

var component = instance_create(x+argument2,y+argument3,argument0);

with(component) {
    name = argument1;
    rel_x = argument2;
    rel_y = argument3;
    width = argument4;
    height = argument5;
    parent = other.id;
    image_xscale = width/2;
    image_yscale = height/2;
}

return component;
