switch(angle_to_cardinal_diagonal(input_direction))
{
    case 0:
    case 4:
        sprite_index = sprWillowRunSide;
        sprArm = sprWillowRunSideArms;
        break;
    case 2:
        sprite_index = sprWillowRunBack;
        sprArm = sprWillowRunBackArms;
        break;
    case 1:
    case 3:
        sprite_index = sprWillowRunQuarterBack;
        sprArm = sprWillowRunQuarterBackArms;
        break;
    case 5:
    case 7:
        sprite_index = sprWillowRunQuarterFront;
        sprArm = sprWillowRunQuarterFrontArms;
        break;
    case 6:
        sprite_index = sprWillowRunFront;
        sprArm = sprWillowRunFrontArms;
        break;
    
}
