///tmc_string_strip_exclude(string_source,string_characters_to_exclude)
/*
    returns a string from string_source where everything found in string_characters_to_exclude stripped out
    
    string_source is the string to check
    string_characters_to_exclude is the string holding the characters that are not valid
    
    var t = tmc_string_strip_exclude("<hello = 123>","<>= 1234567890"); //t = hello
    
*/

var src = argument0,
    exclude = argument1,
    last = string_length(argument0)+1;
var ret = "";   
for(var i = 1; i<last; ++i)
{
    var c = string_char_at(src,i);
    if(0==string_pos(c,exclude))
    {
        ret+=c;
    }
}
return ret;
