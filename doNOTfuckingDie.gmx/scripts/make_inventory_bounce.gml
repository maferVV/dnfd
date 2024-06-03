/// make_inventory_bounce(inventory)
// called from a particle thats about to be destroyed
{
    var inv = argument0;
    with(inv)
    {
        var boing = 0.2;
        backpack_xscale_bounce = -image_xscale*boing;
        backpack_yscale_bounce = image_yscale*(1-boing);
    }
}
