/// print_vars(name1, value1, name2, value2, name3, value3, ...);

var argc = argument_count;
if(argc < 2) return error("not enough args", -1);
if(!is_even(argc)) return error("no even amount of args", -1);
s = "";
for(var i = 0; i < argc; i+=2)
{
    s += "#" + argument[i] + ": ";
    s += string(argument[i+1])+".";
}
print(s);
return s;
