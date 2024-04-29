///tmc_string_between_s(string, startstring, endstring,ci)
/*
    returns the content of the string between the 2 search strings specified
    
    string is the string to copy from
    startstring is the left tag search sting
    endstring is the right tag search string
    ci is the case insensitive true to ignore case
    
    if the first or last searcstring ar not found, "" is returned
    
    var t = tmc_string_between_s("ABCDEFG","a","g",1); //t = 'BCDEF'
    var t = tmc_string_between_s("ABCDEFG","AB","FG",1); //t = 'CDE'
    var t = tmc_string_between_s("ABCDEFG","ABC","EFG",0); //t = 'D'
    var t = tmc_string_between_s("ABCDEFG","a","g",0); //t = ''
    var t = tmc_string_between_s("ABCDEFG","CACA","EFG",0); //t = ''
    var t = tmc_string_between_s("ABCDEFG","ABC","CACA",0); //t = ''

    
*/
var s = tmc_string_left_of_s(argument0,argument2,argument3);
return tmc_string_right_of_s(s,argument1,argument3);
