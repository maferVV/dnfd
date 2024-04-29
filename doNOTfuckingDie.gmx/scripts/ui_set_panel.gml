/// ui_set_panel(script)
{
    var script, panel;
    script = argument0;
    ui_destroy_panels();
    panel = instance_create(0, 0, obj_ui_panel);
    with(panel) {
        script_execute(script);
    }
}
