/// mm_chunk_manager_step()

dt_alarm_update();

print_vars("FPS", fps_real,
            "Instantiated chunks", ds_map_size(instantiator.chunks_entities),
            "Active chunks", mm_chunk_manager_get_active_chunks(),
            "Visble chunks", mm_chunk_manager_get_visible_chunks())

return 1;
