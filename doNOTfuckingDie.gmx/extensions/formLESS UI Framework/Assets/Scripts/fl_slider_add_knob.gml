///fl_slider_add_knob(slider,default_value,width,height,[offset])
/*
    Adds a knob to a slider component. 
    The knob x,y values are always assumed to be positioned at its center point.
    You can specify an offset to change this behaviour.
*/

var slider,index,knob;

slider = argument[0];

with(slider) {
    var index = array_length_1d(knobs);    
    knob = fl_field_init(obj_fl_slider_knob,name+"_knob_"+string(index),round(slider.width/2),round(slider.height/2),argument[2],argument[3]);
    value[index] = argument[1];
    knobs[index] = knob;
    knob.index = index;

    if(argument_count > 4) {
        knob.offset = argument[4]
    }
    
    with(knob) {
        event_user(2); //refresh
    }
}

return knob;