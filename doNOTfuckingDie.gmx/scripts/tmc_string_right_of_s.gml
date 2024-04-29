///tmc_string_right_of_s(string, string_search, ci)
/*
    returns the content of the string on the right of the specified search string
    
    string is the string to copy from
    
    string_search is the string to find and get the content after it
  
    ci is for case insensitive, true if you dont care about the case sensitivity for string_search
    
    if the string_search is not found "" is returned
    
    var t = tmc_string_right_of_s("ABCDEFG","ABC",1); //t = 'DEFG'
    var t = tmc_string_right_of_s("ABCDEFG","a",1); //t = 'BCDEFG'
    var t = tmc_string_right_of_s("ABCDEFG","F",1); //t = 'G'
    var t = tmc_string_right_of_s("ABCDEFG","G",1); //t = ''
    var t = tmc_string_right_of_s("ABCDEFG","CACA",1); //t = ''
    var t = tmc_string_right_of_s("ABCDEFG","a",0); //t = ''
    
*/
var s = argument0;
var ss = argument1;
var ci = argument2;
var s_actual = s;
var ss_actual = ss;
if(ci) 
{
    s_actual = string_lower(s);
    ss_actual = string_lower(ss);
}
var pos = string_pos(ss_actual,s_actual);
if(pos == 0) return "";

var l = string_length(s);
var sl = string_length(ss);
pos+=sl;

return string_copy(s,pos,max(0,1+l-pos));
