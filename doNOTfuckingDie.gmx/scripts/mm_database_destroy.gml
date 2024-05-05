/// mm_database_destroy()

// chunks ds cleanup
for (var k = ds_map_find_first(chunks); !is_undefined(k); k = ds_map_find_next(chunks, k))
{
    var chunk = chunks[? k];
    /* Use k, chunk here */
    ds_grids_destroy_in_map(chunk);
}
// ds_maps_destroy_in_map(chunks);
ds_map_destroy(chunks);

// blueprints ds cleanup
ds_map_destroy(blueprints); // all maps inside are marked so they get destroyed recursively (I FUCKING HOPE)
