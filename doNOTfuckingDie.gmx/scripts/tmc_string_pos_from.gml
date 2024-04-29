///tmc_string_pos_from(substr,str,start_index)
/*
    GML suplemental
    like GML's string_pos but starts the search at the specified position
    
    substr is the string to find 
    str is the string to look for the occrense of substr into
    start_index is the position 1 being the first character position in the string
        
    returns the position of the occurent 1 to n or 0 if not found
    
    var t = tmc_string_pos_from("CDE","ABCDEABCDEABCDE",1); //t = 3
    var t = tmc_string_pos_from("CDE","ABCDEABCDEABCDE",3); //t = 3
    var t = tmc_string_pos_from("CDE","ABCDEABCDEABCDE",4); //t = 8
    var t = tmc_string_pos_from("CDE","ABCDEABCDEABCDE",8); //t = 8
    var t = tmc_string_pos_from("CDE","ABCDEABCDEABCDE",9); //t = 13
    var t = tmc_string_pos_from("CDE","ABCDEABCDEABCDE",13); //t = 13
    var t = tmc_string_pos_from("CDE","ABCDEABCDEABCDE",14); //t = 0
    var t = tmc_string_pos_from("CDE","ABCDEABCDEABCDE",20); //t = 0
    
    
*/
var pos = argument2;
var s2 = argument0;
var s1 = tmc_string_right_of(argument1,pos);
var p = string_pos(s2,s1);
if (p) p+=pos-1;
return p;


