///ui_panel_prepare(obj, script, args, [size = 1])
// Important: x,y,width,height elements are auto set in ui_panel_build.
// size is used to define how many rows are used up by the element.
//
// "args" should be an array.
{
    var obj, script, arr, size;
    obj = argument[0];
    script = argument[1];
    arr = argument[2];
    size = 1; if(argument_count>3) size = argument[3];
    
    ds_list_add(prepared_components, obj);
    ds_list_add(prepared_scripts, script);
    ds_list_add(prepared_arguments, arr);
    ds_list_add(prepared_size, size);
}
