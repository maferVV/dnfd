/// mm_database_save_blueprints()

var json_string = json_encode(blueprints);
var file = file_text_open_write(path);
if (file != -1)
{
    file_text_write_string(file, json_string);
    file_text_close(file);
    print("File saved in "+string(path)+".");
}
else
{
    error("could not open file!", 1);
}

clipboard_set_text(json_string);
print("Save file data saved to clipboard!");
