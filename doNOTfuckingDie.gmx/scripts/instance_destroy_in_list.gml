/// instance_destroy_in_list(list id)
{
    var list = argument0;
    
    for(var i = 0; i < ds_list_size(list); i++)
    {
        var ins = list[| i];
        if(instance_exists(ins)) instance_destroy(ins);
    }
}
