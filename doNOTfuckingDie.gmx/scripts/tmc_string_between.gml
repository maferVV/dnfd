///tmc_string_between(string, startpos, endpos)
/*
    returns the content of the string between the 2 position specified
    
    string is the string to copy from
    
    startpos is the position of to start copyinging from
    endpos is the position (inclusive) of to stop copyinging from
    if the position is beyond the string length then the full string is returned
    
    var t = tmc_string_between("ABCDEFG",1,1); //t = 'A'
    var t = tmc_string_between("ABCDEFG",1,2); //t = 'AB'
    var t = tmc_string_between("ABCDEFG",1,3); //t = 'ABC'
    var t = tmc_string_between("ABCDEFG",2,4); //t = 'BCD'
    var t = tmc_string_between("ABCDEFG",3,5); //t = 'CDE'
    var t = tmc_string_between("ABCDEFG",7,7); //t = 'G'
    var t = tmc_string_between("ABCDEFG",7,8); //t = 'G'
    var t = tmc_string_between("ABCDEFG",8,10); //t = ''
    
*/
var s = argument0;
var spos = argument1;
var epos = argument2;
var l = string_length(s);
l = clamp(epos-spos+1,0,l-spos+1);
return string_copy(s,spos,l);
