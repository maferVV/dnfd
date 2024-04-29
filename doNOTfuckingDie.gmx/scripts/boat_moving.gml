boat_readInputs();
boat_rope_behavior();

if(input_direction != -1)
{
    var appliedTorqueSpd = max(minTorqueSpd, torqueSpd * phy_speed);
    if(inputdog_down("left", playerSlot)) physics_apply_torque(-appliedTorqueSpd);
    if(inputdog_down("right", playerSlot)) physics_apply_torque(appliedTorqueSpd);
    
    var dir = -phy_rotation;
    var xforce = lengthdir_x(moveSpd, dir);
    var yforce = lengthdir_y(moveSpd, dir);
    if(inputdog_down("up", playerSlot))
    {
        var len = point_distance(x,y,x-14,y);
        dir = point_direction(x,y,x-14,y)+dir;
        var xmotor = x+lengthdir_x(len, dir);
        var ymotor = y+lengthdir_y(len, dir);
        physics_apply_force(xmotor, ymotor, xforce, yforce);
        //debug
        p = particle_create(xmotor, ymotor);
        p.destroy_at_alpha_less_than_0 = true;
        p.alpha_speed = -0.005;
        p.depth = -100000;
        with(p){ set_scale(1); }
    }
}
else
    state_switch("idle");
