/// ds_list_to_string(list, [lpad = 3])
var list = argument[0];
var s = "";
var lpad = 3;
if(argument_count > 1) lpad = argument[1];
s += "LIST(no."+string(list)+"):";
for(var i = 0; i < ds_list_size(list); i++)
{
    s += "#";
    s += string_lpad(string(i),lpad,"0")+":" +string(ds_list_find_value(list,i));
}
return s;
