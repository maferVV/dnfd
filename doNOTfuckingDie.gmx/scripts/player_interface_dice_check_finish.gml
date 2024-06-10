if(state_new)
{
    draw_roll_check = true;
    
    // spawn dice
    with(dice1){ rolling = false; }
    with(dice2){ rolling = false; }
    
    roll_result = floor(dice1.value + dice2.value);
    
    dice_text = "Got "+string(roll_result);
                
    
    if( roll_result <= check_number )
    {
        // :D
        fg_color = merge_colour(c_white, c_black, 0.95);
        with( objDisplayManager )
        {
            strength_desired = 0.2;
            lut_subimg_desired = 8;
        }
        fg_alpha = 0.6;
        dice_text+=" !";
        
        execute_success_script();
    }
    else
    {
        // :c
        dice_text+=".";
        fg_color = merge_colour(c_red, c_black, 0.8);
        with( objDisplayManager )
        {
            strength_desired = 4;
            lut_subimg_desired = 2;
        }
        with( objWillow ){ state_switch("flop"); }
        screenshake(25, 8, 3);
        
        execute_failure_script();
    }
    
    dice_text += "#"+"Press ["+nat(inputdog_get_key_of_input(1,"interact"))
                +"] to continue."
}
player_interface_read_inputs();



if(pause_pressed||interact_pressed)
{
    with(player){willow_give_control();}
    fg_alpha = 0;
    objGameManager.canPause = true;
    draw_dice_roll = false;
    instance_destroy(dice1);
    instance_destroy(dice2);
    with(objWorldManager)
    {
        world_manager_apply_lut();
    }
    player_interface_default_roll_scripts();
    state_switch("disabled");
}
