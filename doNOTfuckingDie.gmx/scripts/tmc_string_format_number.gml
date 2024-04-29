///tmc_string_format_number(str, str_thou, str_dec)
/*
    Formats a string that contantns a number in the format specifiec by
        tmc_string_number using the specified str_thou for thousands 
        and str_dec for the decimal
        
    str is the string holding a valid number
        allowed format "[+-][XXX][.[FFF]]"
    
    str_thou is the thousand seperator
    
    str_dec is a decimal separator
    t = tmc_string_format_number("1234.56"," ",","); // t= "1 234,56"
    or
    t = tmc_string_format_number(string(1234.56)," ",","); // t= "1 234,56"
*/
var s = argument0;
var thou = argument1;
var dec = argument2;
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
        var dl = string_length(r);
        var rr = tmc_string_reverse(r);
        r = "";
        for(var j = 1; j<=dl; j++)
        {
            c = string_char_at(rr,j);
            if((!(c == "-" or c == "+")) and (j>1) and ((j-1) mod 3 ==0))
            {
               r+=thou;
            }
           r+= c;
           
        }
        r = tmc_string_reverse(r);
        r+=dec;
        didDec = true;
    }
    else if((c == "-" or c == "+") and r == "")
    {
        r+=c;
    }
}
if(r == "") return "0"
if(didDec == false)
{
    var dl = string_length(r);
    var rr = tmc_string_reverse(r);
    r = "";
    for(var j = 1; j<=dl; j++)
    {
        c = string_char_at(rr,j);
        if((!(c == "-" or c == "+")) and (j>1) and ((j-1) mod 3 ==0))
        {
           r+=thou;
        }
       r+= c;
       
    }
    r = tmc_string_reverse(r);
}
return r;

