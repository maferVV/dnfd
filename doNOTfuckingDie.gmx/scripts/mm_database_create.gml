/// mm_database_create()
/// Create event for the database of world generation
/// Mappa Mundi - GMS thingy for better procedural generation in dNfD

/// references
cam = noone;
drawer = noone;
instantiator = noone;

// create drawer
if(true)
{
    drawer = instance_create(x, y, objMMDatabaseDrawer);
    drawer.db = id;
    drawer.cursor = objCursor;
}

/// vars
// How many tiles width/height?
chunk_size = 16;
tile_size_pixels = 8;

/// Data structures
// A map containing maps (representing chunks)
//     containing grids (representing perlin grids)
chunks = ds_map_create();
// A map containing maps (representing chunks)
//     containing maps (representing instances with unique ids)
//         containing maps (an attribute:value relationship)
filename = "save_file.json";
path = working_directory + filename;
var file = file_text_open_read(path);
if(file != -1)
{
    blueprints = json_decode(file_text_read_string(file));
    print("Save from disc loaded");
    file_text_close(file);
}
else
{
    blueprints = ds_map_create(); // save file didnt exist
}
/// perlin noise info
seed_init = floor(random_range(65536,6553600));
seed = seed_init;
print("seed: " + string(seed_init));
print("seed's name: " + speakable_password(6)+" "+speakable_password(4));
//DS_MAP with possible script outputs and cooresponding tile numbers. Decoded from JSON string.
//As with all data structures, don't forget to destroy it, to prevent memory leaks.
tile_map = json_decode(
        '{ "254": 45, "90": 22, "22": 7, "0": 47, "10": 3, "2": 1,
         "94": 24, "120": 29, "11": 4, "208": 34, "107": 28, "82": 19,
          "216": 37, "86": 20, "223": 41, "214": 36, "104": 26, "222": 40,
           "74": 16, "18": 6, "8": 2, "248": 42, "255": 46, "127": 33,
            "123": 31, "66": 14, "16": 5, "219": 39, "75": 17, "80": 18,
             "122": 30, "30": 11, "126": 32, "31": 12, "250": 43, "88": 21,
              "64": 13, "95": 25, "251": 44, "91": 23, "24": 8, "27": 10,
               "218": 38, "72": 15, "106": 27, "26": 9, "210": 35 }');
