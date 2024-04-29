/// bbox_3D_update()
/// update the vars bbox_front and bbox_back
/// bbox_left is ususally lower than bbox_right
/// bbox_up   is ususally lower than bbox_bottom
/// So the lower num should be bbox_back

switch(collision_type)
{
    case bbox_type.billboard:
        // All billboard sprites are supposed to have
        // their origin at the bottom of bbox_down.
        bbox_depth = sprite_height;
        bbox_back = ceil(z);
        bbox_front = bbox_back + bbox_depth;
        break;
    case bbox_type.stackable:
        //
        bbox_depth = sprite_get_number(sprite_index)*height;
        bbox_back = ceil(z);
        bbox_front = bbox_back + bbox_depth;
        break;
}
