/// spring_create(target height, height, tension, dampening, speed)

s_targetheight = 300; if(argument_count>0) s_targetheight = argument[0];
s_height = 0; if(argument_count>1) s_height = argument[1];
s_tension = 0.025; if(argument_count>2) s_tension = argument[2];
s_dampening = 0.025; if(argument_count>3) s_dampening = argument[3];
s_spd = 0; if(argument_count>4) s_spd = argument[4];
