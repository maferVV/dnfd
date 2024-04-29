///tmc_string_is_lower(str)
/*
    returns if the string is a lower casse
    
    WARNING the functions allow non alphabetical characters
    
    var t = tmc_string_is_lower("ABC"); //t = 0;
    var t = tmc_string_is_lower("abc"); //t = 1;
    var t = tmc_string_is_lower("1234"); //t = 1;
    var t = tmc_string_is_lower("1234."); //t = 1;
    var t = tmc_string_is_lower("-1234."); //t = 1;
    var t = tmc_string_is_lower("+1234.0"); //t = 1;
    
*/
if(argument0 == "") return 0;

return(string_lower(argument0) == argument0);
