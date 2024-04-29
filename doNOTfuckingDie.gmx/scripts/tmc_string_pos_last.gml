///tmc_string_pos_last(substr,str)
/*
    GML suplemental
    like GML's string_pos but finds the last occurrence
    
    substr is the string to find 
    str is the string to look for the occrense of substr into
    
        
    returns the position of the occurent 1 to n or 0 if not found
    
    var t = tmc_string_pos_last("CDE","ABCDE"); //t = 3
    
*/
var s2 = tmc_string_reverse(argument0);
var s1 = tmc_string_reverse(argument1);
var l = string_length(s1);
var p = string_pos(s2,s1);
if(p)
{
    p=l-p;
    p++;
}
return p;

