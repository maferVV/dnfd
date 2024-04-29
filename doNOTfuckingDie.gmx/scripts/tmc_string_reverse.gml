///tmc_string_reverse(string)
/*
    reverses the character in the string
    
    string is the string to reverse
    
    var t = tmc_string_reverse("ABCDEF"); //t = 'FEDCBA'
    
*/
var s = argument0;
var l = string_length(s);
var r = "";

for(var i = l; i>0; i--)
{
    r+=string_char_at(s,i);
}
return r;
