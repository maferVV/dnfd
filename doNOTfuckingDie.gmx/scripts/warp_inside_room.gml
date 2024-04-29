/// warp_inside_room([xoffset],[yoffset])
var xoff = 0; if(argument_count>0) xoff = argument[0];
var yoff = 0; if(argument_count>1) yoff = argument[1];
if(x<0+xoff)x=room_width-xoff;
if(x>room_width-xoff)x=0+xoff;
if(y<0+yoff)y=room_height-yoff;
if(y>room_height-yoff)y=0+yoff;
