///tmc_string_right_of(string, pos)
/*
    returns the content of the string on the right of the position specified
    
    string is the string to copy from
    
    pos is the position of to start copyinging from
    
    if the position is beyond the string length then "" is returned
    
    var t = tmc_string_right_of("ABCDEFG",1); //t = 'ABCDEFG'
    var t = tmc_string_right_of("ABCDEFG",2); //t = 'BCDEFG'
    var t = tmc_string_right_of("ABCDEFG",3); //t = 'CDEFG'
    var t = tmc_string_right_of("ABCDEFG",4); //t = 'DEFG'
    var t = tmc_string_right_of("ABCDEFG",5); //t = 'EFG'
    var t = tmc_string_right_of("ABCDEFG",6); //t = 'FG'
    var t = tmc_string_right_of("ABCDEFG",7); //t = 'G'
    var t = tmc_string_right_of("ABCDEFG",8); //t = ''
    var t = tmc_string_right_of("ABCDEFG",9); //t = ''
    
*/
var s = argument0;
var l = string_length(s);
var pos = argument1;

return string_copy(s,pos,max(0,1+l-pos));
