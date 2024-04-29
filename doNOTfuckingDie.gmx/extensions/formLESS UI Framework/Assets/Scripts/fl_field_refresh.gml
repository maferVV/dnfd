///fl_field_refresh(id or name)
/*
    Refreshes the component value / attributes.
    See the documentation for more info.
    Accepts either the component name or its id.
*/

var component;

if(is_string(argument0)) {
    component = fl_field_find(argument0);
}
else {
    component = argument0;
}

with(component) {
    event_user(2);
}