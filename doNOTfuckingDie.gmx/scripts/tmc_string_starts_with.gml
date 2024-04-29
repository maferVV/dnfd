///tmc_string_starts_with(string1,string2,case_sensitive)
/*
    returns if string1 starts with string2, 
    
    string1 is the string to check the occurrence of string2
    string2 is the string to check if string1 starts with
    
    case_sensitive is the compare mode. 0 for not sensitive,1 for sensitive
    
    returns true or false
    
    
    
    var t = tmc_string_starts_with("ABCDE","ABC",0); //t = 1
    
*/
var s1 = argument0;
var s2 = argument1;
var cs = argument2;
if(!cs)
{
    s1 = string_lower(s1);
    s2 = string_lower(s2);
}

return (string_pos(s2,s1) == 1);
