///tmc_string_split(string, delimiter)
/*
    returns an array with each item being the values seprated by the delimiter
    
    string is the string to split
    
    delimiter is the character or characters to use to as delimeters, cannot be chr(1)
    
    array item 0 (arr[0]) will be the number of items found. this simplifies the use, 
    you will ALWAYS get an array back with the first entry be the count, followed by the values
    this way you dont need to make a special case is the funtion rusults in no values
    
    about the only time arr[0] is 0 is passing an empty string
    var arr = tmc_string_split("0,1,2,3,4,5,6",","); //arr = {{7,0,1,2,3,4,5,6}}
    var arr = tmc_string_split("",","); //arr = {{0}}
    var arr = tmc_string_split("0,1 2 3,4-5-6"," ,-"); //arr = {{7,0,1,2,3,4,5,6}}
    
    for (var i = 1; i<=arr[0]; i++)
    {
        show_debug_message(arr[i]);
    }
    
    
*/
var s = argument0;
var d = argument1;
var dlen = string_length(d);
var slen = string_length(s);
var delim = chr(1);
//convert the delimeters in the string to a standard one, chr(1)
for(var i = 1; i<=dlen;++i)
{
    s = string_replace_all(s,string_char_at(d,i),delim);
}

var c = "";
var ret;
ret[0] = 0;
if(slen)
{
    ret[0] = 1;
    ret[ret[0]] = "";
    for(var i = 1; i<=slen; ++i)
    {
        c = string_char_at(s,i);
        if(c != delim)
        {
            ret[ret[0]] += c;
        }
        else
        {
            ret[@0]=ret[0]+1;
            ret[ret[0]] = "";
        }
    }
}
return ret;
