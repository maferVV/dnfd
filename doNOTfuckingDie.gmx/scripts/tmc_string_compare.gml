///tmc_string_compare(string1,string2,case_sensitive)
/*
    returns if string1 equated string2, 
    
    string1 is the string to check against string2
    string2 is the string to check against string1
    
    case_sensitive is the compare mode. 0 for not sensitive,1 for sensitive
    
    returns true or false
    
    
    
    var t = tmc_string_compare("ABCDE","ABCDE",0); //t = 1
    var t = tmc_string_compare("abcde","ABCDE",0); //t = 1
    var t = tmc_string_compare("abcde","ABCDE",1); //t = 0
    
*/
var s1 = argument0;
var s2 = argument1;
var cs = argument2;
if(!cs)
{
    s1 = string_lower(s1);
    s2 = string_lower(s2);
}

return (s1 == s2);

