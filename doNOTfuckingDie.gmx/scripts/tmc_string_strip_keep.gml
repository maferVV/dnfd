///tmc_string_strip_keep(string_source,string_characters_to_keep)
/*
    returns a string from string_source where everything not in string_characters_to_keep stripped out
    
    string_source is the string to check
    string_characters_to_keep is the string holding the characters that are valid
    
    var t = tmc_string_strip_keep("<hello = 123>","abcdefghijklmnopqrstuvwxyz"); //t = hello
    
*/

var src = argument0,
    keep = argument1,
    last = string_length(argument0)+1;
var ret = "";   
for(var i = 1; i<last; ++i)
{
    var c = string_char_at(src,i);
    if(string_pos(c,keep))
    {
        ret+=c;
    }
}
return ret;
