///fl_add_slider(name,rel_x,rel_y,width,height,[min_value],[max_value],[step],[vertical])
/*
    Assigns a slider to an instance. Returns a slider instance you can pass to 
    fl_slider_add_knob() to add any number of knobs.
    If step is specified, the slider knobs will "jump" from one value to the other
    by the step amount provided (-1 means no step applied).
*/

var component = fl_field_init(obj_fl_slider,argument[0],argument[1],argument[2],argument[3],argument[4]);

with(component) {
    if(argument_count > 5) {
        min_value = argument[5];
    }
    if(argument_count > 6) {
        max_value = argument[6];
    }
    if(argument_count > 7) {
        step = argument[7];
    }
    if(argument_count > 8) {
        vertical = argument[8];
    }
}

return component;
