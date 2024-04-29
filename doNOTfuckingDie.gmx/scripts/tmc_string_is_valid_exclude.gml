///tmc_string_is_valid_exclude(string_source,string_characters_to_exclude)
/*
    returns true if the string has all valid characted that are NOT contained in string_characters_to_exclude
    
    string_source is the string to check
    string_characters_to_exclude is the string holding the characters that are NOT valid
    
    var t = tmc_string_is_valid_exclude(<hello = 123>","<>= 1234567890"); //t = false
    var t = tmc_string_is_valid_exclude("hello","<>= 1234567890"); //t = true
    
*/

return (argument0 == tmc_string_strip_exclude(argument0,argument1));
