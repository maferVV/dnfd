/// ui_panel_build()
// builds all of the prepared components
{
    var rows = 0;
    for(var i = 0; i < ds_list_size(prepared_size); i++){ rows+=prepared_size[| i]; }
    var rowHeight = sprite_height/rows;
    var rowOffset = rowHeight*0.25; // space between elements
    var rowWidth = sprite_width;
    var xx = x;
    var yy = y;
    
    var currentRow = 0;
    for(var i = 0; i < ds_list_size(prepared_components); i++)
    {
        var obj = prepared_components[| i];
        var script = prepared_scripts[| i];
        var args = prepared_arguments[| i];
        var size = prepared_size[| i];
        with( instance_create(xx, yy + (rowHeight*currentRow), obj) )
        {
            // change dimensions on both component and fl
            set_sprite_size(rowWidth,(rowHeight*size)-rowOffset);
            args[3] = sprite_width;
            args[4] = sprite_height;
            
            // build fl
            f = script_execute_args(script, args);
        }
        currentRow += size;
    }
}
