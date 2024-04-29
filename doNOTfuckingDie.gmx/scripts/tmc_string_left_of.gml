///tmc_string_left_of(string, pos)
/*
    returns the content of the string on the left of the position specified
    
    string is the string to copy from
    
    pos is the position of to start copyinging from
    
    if the position is beyond the string length then the full string is returned
    
    var t = tmc_string_left_of("ABCDEFG",0); //t = ''
    var t = tmc_string_left_of("ABCDEFG",1); //t = ''
    var t = tmc_string_left_of("ABCDEFG",2); //t = 'A'
    var t = tmc_string_left_of("ABCDEFG",3); //t = 'AB'
    var t = tmc_string_left_of("ABCDEFG",4); //t = 'ABC'
    var t = tmc_string_left_of("ABCDEFG",5); //t = 'ABCD'
    var t = tmc_string_left_of("ABCDEFG",6); //t = 'ABCDE'
    var t = tmc_string_left_of("ABCDEFG",7); //t = 'ABCDEF'
    var t = tmc_string_left_of("ABCDEFG",8); //t = 'ABCDEFG'
    var t = tmc_string_left_of("ABCDEFG",9); //t = 'ABCDEFG'
    
*/
var s = argument0;
var pos = argument1;
var l = string_length(s)
return string_copy(s,1,clamp(pos-1,0,l));
