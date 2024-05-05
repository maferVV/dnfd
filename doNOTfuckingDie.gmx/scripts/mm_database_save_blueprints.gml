/// mm_database_save_blueprints()

var json_string = json_encode(blueprints);
var file = file_text_open_write("save_file.json");
if (file != -1)
{
    file_text_write_string(file, json_string);
    file_text_close(file);
}
else
{
    error("could not open file!", 1);
}

show_debug_message("Opening folder...");
var path = working_directory + "save_file.json"; // Replace with your file name
//execute_shell("explorer.exe /select," + path);

ds_map_print(blueprints);
