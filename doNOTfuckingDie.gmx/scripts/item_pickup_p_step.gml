/// item_pickup_p_step()

if(!instance_exists(inventory_manager)) return 0;

depth = inventory_manager.depth - 20;

anim_i += 1 * global.delta_step;
anim_i = clamp(anim_i, 0, anim_i_max);
curve = EaseOutElastic(anim_i, 0, 1, anim_i_max);
curve2 = EaseInBack(anim_i, 0, 1, anim_i_max);
curve3 = EaseInQuint(anim_i, 0, 1, anim_i_max);

x = map_value(curve, 0, 1, xstart, inventory_manager.backpack_xoffset);
y = map_value(curve2, 0, 1, ystart, inventory_manager.backpack_yoffset);
draw_scale = map_value(curve3, 0, 1,
                        inventory_manager.image_xscale*1.6,
                        inventory_manager.image_xscale*0.8);

if(anim_i == anim_i_max)
{
    make_inventory_bounce(inventory_manager);
    instance_destroy();
}
