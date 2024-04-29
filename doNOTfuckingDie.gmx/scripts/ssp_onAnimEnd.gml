switch(state)
{
    case ssp_jump:
        dt_image_index = image_number-1;
        dt_image_speed = 0;
        break;
    case ssp_attack:
        instance_destroy(hitbox);
        state_switch("idle");
        dt_image_index = image_number-1;
        dt_image_speed = 0;
        break;
}
