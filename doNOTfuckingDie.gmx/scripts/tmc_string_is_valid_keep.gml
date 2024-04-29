///tmc_string_is_valid_keep(string_source,string_characters_to_keep)
/*
    returns true if the string has all valid characted as contained in string_characters_to_keep
    
    string_source is the string to check
    string_characters_to_keep is the string holding the characters that are valid
    
    var t = tmc_string_is_valid_keep("<hello = 123>","abcdefghijklmnopqrstuvwxyz"); //t = false
    var t = tmc_string_is_valid_keep("hello","abcdefghijklmnopqrstuvwxyz"); //t = true
    
*/

return (argument0 == tmc_string_strip_keep(argument0,argument1));
