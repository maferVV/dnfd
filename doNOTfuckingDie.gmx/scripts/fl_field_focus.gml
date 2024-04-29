///fl_field_focus(id or name)
/*
    Gives focus to the specified component.
    Accepts either the component name or its id.
    Returns 0 if succesful.
*/

var component = noone;

if(is_string(argument0)) {
    component = fl_field_find(argument0);
}
else {
    component = argument0;
}

if(!instance_exists(component))
    return error("Component "+string(component)+" doesnt exist", 1);

with(component) {
    event_user(0);
}

return 0;
