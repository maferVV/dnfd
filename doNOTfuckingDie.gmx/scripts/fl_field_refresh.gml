///fl_field_refresh(id or name)
/*
    Refreshes the component value / attributes.
    See the documentation for more info.
    Accepts either the component name or its id.
*/

var component = noone;

if(is_string(argument0)) {
    component = fl_field_find(argument0);
}
else {
    component = argument0;
}

if(!instance_exists(component))
    return error("Component "+string(component)+" does not exist.", 1);

with(component) {
    event_user(2);
}

return 0;
