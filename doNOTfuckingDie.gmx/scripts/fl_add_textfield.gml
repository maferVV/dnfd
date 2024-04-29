///fl_add_textfield(name,rel_x,rel_y,width,height,[default_value],[font],[limit],[masked])
/*
    Assigns a textfield to an instance.
    If you want the textfield to behave consisntently with your font, you have to
    pass it as argument. Limit is the maximum number of characters allowed
    in the field (defaults to 255).
*/

var component = fl_field_init(obj_fl_textfield,argument[0],argument[1],argument[2],argument[3],argument[4]);

with(component) {
    if(argument_count > 6) {
        font = argument[6];
    }
    if(argument_count > 7) {
        limit = argument[7];
    }
    if(argument_count > 8) {
        masked = argument[8];
    }
    if(argument_count > 5) {
        value = argument[5];
        event_user(2);
    }
}

return component;
