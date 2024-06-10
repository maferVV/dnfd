/// ds_list_merge(a,b);
//
//      Returns a newly created list with the values inside both lists or noone if neither list exists.
//
/// GMLscripts.com/license
{
    var a,b,c;
    a = argument0;
    b = argument1;
    c = ds_list_create();
    
    if( ds_exists(a,ds_type_list) )
    {
        for( var i = 0; i < ds_list_size(a); i++ )
        {
            ds_list_add( c, ds_list_find_value(a,i) );
        }
    }
    
    if( ds_exists(b,ds_type_list) )
    {
        for( var i = 0; i < ds_list_size(b); i++ )
        {
            ds_list_add( c, ds_list_find_value(b,i) );
        }
    }
    
    if( !ds_exists(a,ds_type_list) && !ds_exists(b,ds_type_list) )
    {
        ds_list_destroy(c);
        c = noone;
    }
    
    return c;
}
