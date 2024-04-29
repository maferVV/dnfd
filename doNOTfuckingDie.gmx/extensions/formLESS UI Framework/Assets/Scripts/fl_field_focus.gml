///fl_field_focus(id or name)
/*
    Gives focus to the specified component.
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
    event_user(0);
}