/// string_replace_at(str, n, char)
/// @description string_replace_at()
/// @param original
/// @param n
/// @param insert

if (string_length(argument0)>=argument1) {
    
    var tempString = "";
    tempString = string_insert(argument2,argument0,argument1);
    tempString = string_delete(tempString,argument1+1,1);
    return tempString;
    
} else {
    
    return argument0;
    
}
