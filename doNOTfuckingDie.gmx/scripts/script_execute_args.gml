/// script_execute_args(script, args_array)
{
    var script, args_array;
    script = argument0;
    args_array = argument1;
    
    switch(array_length_1d(args_array))
    {
        case  0: return script_execute(script);
        case  1: return script_execute(script,args_array[00]);
        case  2: return script_execute(script,args_array[00],args_array[01]);
        case  3: return script_execute(script,args_array[00],args_array[01],args_array[02]);
        case  4: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03]);
        case  5: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04]);
        case  6: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04],args_array[05]);
        case  7: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04],args_array[05],args_array[06]);
        case  8: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04],args_array[05],args_array[06],args_array[07]);
        case  9: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04],args_array[05],args_array[06],args_array[07],args_array[08]);
        case 10: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04],args_array[05],args_array[06],args_array[07],args_array[08],args_array[09]);
        case 11: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04],args_array[05],args_array[06],args_array[07],args_array[08],args_array[09],args_array[10]);
        case 12: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04],args_array[05],args_array[06],args_array[07],args_array[08],args_array[09],args_array[10],args_array[11]);
        case 13: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04],args_array[05],args_array[06],args_array[07],args_array[08],args_array[09],args_array[10],args_array[11],args_array[12]);
        case 14: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04],args_array[05],args_array[06],args_array[07],args_array[08],args_array[09],args_array[10],args_array[11],args_array[12],args_array[13]);
        case 15: return script_execute(script,args_array[00],args_array[01],args_array[02],args_array[03],args_array[04],args_array[05],args_array[06],args_array[07],args_array[08],args_array[09],args_array[10],args_array[11],args_array[12],args_array[13],args_array[14]);
    }
    
    return error("args_array length is not a number 0-15: "+string(array_length_1d(args_array)), noone);
    
}
