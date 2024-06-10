/// willow_item_interaction()
// returns true if i could interact with an entity succesfully
with(objMMEntityParent){is_hover = false;}
var entities_touching = instance_place_list(x, y, objMMEntityParent);
var entities_fov = collision_fov_list(x, decimal_bbox_bottom(), objMMEntityParent, interact_radius, facedir, interact_aperture, true);
var entities = ds_list_merge(entities_touching, entities_fov);
if(entities == noone) return false;
for(var i = 0; i < ds_list_size(entities); i++)
{
    var entity = entities[| i];
    if(entity.interactable && script_exists(entity.interact_script))
    {
        var wall_id = collision_line(x, decimal_bbox_bottom(), entity.x, entity.y, collision_object, true, true);
        if( !instance_exists(wall_id) || (instance_exists(wall_id) && wall_id.can_interact_through) )
        {
            entity.is_hover = true;
            if(interact_pressed)
            {
                with(entity)
                {
                    script_execute(interact_script, other.id);
                }
                return true;
            }
        }
    }
}
ds_list_destroy(entities);
if(entities_fov != noone) ds_list_destroy(entities_fov);
if(entities_touching != noone) ds_list_destroy(entities_touching);
return false;
