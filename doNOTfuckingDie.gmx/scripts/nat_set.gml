if( variable_global_exists("natlangmap") && (ds_exists(global.natlangmap, ds_type_map)) )
    nat_destroy();

var map;
lang = argument0 + ".nat";

phrase = argument0;
raw = "";

langdat = file_text_open_read(lang);
while(!file_text_eof(langdat)){
    raw += file_text_read_string(langdat);
    file_text_readln(langdat);
}
file_text_close(langdat);

global.natlangmap = json_decode(raw);
