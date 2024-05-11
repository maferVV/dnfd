/// mm_database_delete_all_data()
{
    mm_database_destroy();
    mm_database_save_blueprints();
    chunks = ds_map_create();
    blueprints = ds_map_create();
}
