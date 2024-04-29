/// spring_step()
var s_displacement = (s_targetheight - s_height);
s_spd += (s_tension*s_displacement)-(s_dampening*s_spd);
