/// nest_dig( nest )

{
    var nest = argument0;
    with(nest)
    {
        if(!is_ravaged)
        {
            hp--;
            if(hp <= 0)
            {
                obstacle_set_ravaged(nest, true);
                item_generate_at(x, y, "nestPart");
                item_generate_at(x, y, "nestPart");
            }
            else
            {
                item_generate_at(x, y, "nestPart");
            }
        }
    }
}
