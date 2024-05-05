/// mm_database_create()
/// Create event for the database of world generation
/// Mappa Mundi - GMS thingy for better procedural generation in dnFd

/// references
cam = noone;
drawer = noone;

/// vars
// How many tiles width/height?
chunk_size = 8;

/// Data structures
// A map containing maps (representing chunks)
//     containing grids (representing perlin grids)
chunks = ds_map_create();
// A map containing maps (representing chunks)
//     containing maps (representing instances with unique ids)
//         containing maps (an attribute:value relationship)
blueprints = ds_map_create();
/// perlin noise info
seed = random_range(65536,6553600);
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
