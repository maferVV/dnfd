if(state_new)
{
    sprite_index = sprBatFlying;
    dt_image_speed = 35/60;
    

    // fill path with points
    var lvl = objLevelManager_2Dexample;
    var pathfinding_succesful = mp_grid_path(lvl.grid,
                                path,
                                floor(x),
                                floor(y),
                                floor(objCatHero.x),
                                floor(objCatHero.y),
                                true);
    if(!pathfinding_succesful)
    {
        state_switch(bat_idle);
    }
    
    path_nav_index = 0;
}

var xx = path_get_point_x(path, path_nav_index);
var yy = path_get_point_y(path, path_nav_index);
var len = point_distance(x, y, xx, yy);
if( len <= 15 )
{
    path_nav_index++;
}
tmc_dt_add_towards_point(xx, yy, spdMax);
tmc_dt_step_full();
draw_dir = angle_to_left_right( tmc_dt_get_direction() );

len = point_distance(x, y, objCatHero.x, objCatHero.y);
if(len <= 32)
{
    state_switch(bat_attack);
}

if( path_nav_index==path_get_number(path)-1 )
{
    state_switch(bat_idle);
}
