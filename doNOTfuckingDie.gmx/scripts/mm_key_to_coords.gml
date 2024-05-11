/// mm_key_to_coords(key)
// chunk coords
{
    var key,str;
    key = argument0;
    str = tmc_string_split(key, ",");
    if(str[0] == 2)
        return array(str[1], str[2]);
    else
        return error(key+"is of length "+str[0], 0);
}
