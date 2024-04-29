///tmc_string_number(str)
/*
    GML suplemental
    like GML's string_digits but supports the decimal "."
    
    Yes, the DECIMAL is a "." and nothing else
    str is the string to extract the numbeer from
        
    returns a STRING which can safely be used in the real() call
    
    or it can be used paired with get_string() as a replacement to get_integer()
    
    var t = tmc_string_number("The value I entered is 10 with the fraction of .10"); //t = '10.10'
    
    if the string has no valid digits, "0" is returned
    
    returned format "[+-][XXX][.[FFF]]"
    
*/
var s = argument0;
var r = "";
var l = string_length(s);
var c,oc;
var didDec = false;
for(var i = 1; i<=l; i++)
{
    c = string_char_at(s,i);
    oc = ord(c);
    if(oc >= 48 and oc<=57)
    {
        r+=c;
    }
    else if(c == "." and didDec == false)
    {
        r+=c;
        didDec = true;
    }
    else if((c == "-" or c == "+") and r == "")
    {
        r+=c;
    }
}
if(r == "") return "0"
return r;

