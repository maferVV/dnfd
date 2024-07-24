/// item_name_to_sprite(str)
{
    var str = argument0;
    switch(str)
    {
        case "pebble": return sprItemPebble; break;
        case "stick": return sprItemStick; break;
        case "sword": return sprItemSword; break;
        case "nestPart": return sprItemTermitePart; break;
        default: return sprItemPoop; break;
    }
}
