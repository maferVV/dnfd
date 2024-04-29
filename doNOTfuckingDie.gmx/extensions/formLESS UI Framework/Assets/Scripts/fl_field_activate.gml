///fl_field_activate(id or name)
/*
    Executes the field action (if applicable). 
    e.g: executes a button action or checks/unchecks a checkbox.
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
    event_user(3);
}