///tmc_string_trim_right(string)
/*
    trims all white space from the right of the string
    
    string is the string with whitespace
    
    a white space is any space or lesser ascii value in the string
    
    var t = tmc_string_trim_right("Hello    "); //t = 'Hello'
    
*/
var r = argument0;
var l = string_length(r);
var p = l;
for(var i = 0; i<l; i++)
{
    if(ord(string_char_at(r,p))>32) 
    {
        break;
    }
    p--;
}
if(p<=0) return "";

return "" + string_copy(r,1,p);
