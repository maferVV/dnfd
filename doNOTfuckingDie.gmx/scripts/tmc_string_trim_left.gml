///tmc_string_trim_left(string)
/*
    trims all white space from the left of the string
    
    string is the string with whitespace
    
    a white space is any space or lesser ascii value in the string
    
    var t = tmc_string_trim_left("   Hello"); //t = 'Hello'
    
*/
var r = argument0;
var l = string_length(r);
var l2 = l;
var p = 1;
for(var i = 0; i<l2; i++)
{
    if(ord(string_char_at(r,p))>32) 
    {
        break;
    }
    p++;
    l--;
}
if(l<=0) return "";

return "" + string_copy(r,p,l);
