///draw_perlin_grid()
var xscale = tileSize/sprite_get_width(spr_water_2dig);
var yscale = tileSize/sprite_get_height(spr_water_2dig);
for(var i = 0; i < width; i++)
{
    for(var j = 0; j < height; j++){
        // Tile gen ↓ . Don't forget to set tileSize to the sprite size (8 for included sprites).
        
        if(grid[#i, j] <= 0.15){draw_sprite_ext(spr_water_2dig, 0, x+(i*tileSize), y+(j*tileSize), xscale, yscale, image_angle, image_blend, image_alpha);}
        else if(grid[#i, j] > 0.15 && grid[#i, j] < 0.25){draw_sprite_ext(spr_sand_2dig, 0, x+(i*tileSize), y+(j*tileSize), xscale, yscale, image_angle, image_blend, image_alpha);}
        else if(grid[#i, j] >= 0.25 && grid[#i, j] <= 0.6){draw_sprite_ext(spr_grass_2dig, 0, x+(i*tileSize), y+(j*tileSize), xscale, yscale, image_angle, image_blend, image_alpha);}
        else if(grid[#i, j] > 0.6 && grid[#i, j] <= 0.7){draw_sprite_ext(spr_dirt_2dig, 0, x+(i*tileSize), y+(j*tileSize), xscale, yscale, image_angle, image_blend, image_alpha);}
        else if(grid[#i, j] > 0.7 && grid[#i, j] <= 0.8){draw_sprite_ext(spr_stone_2dig, 0, x+(i*tileSize), y+(j*tileSize), xscale, yscale, image_angle, image_blend, image_alpha);}
        else if(grid[#i, j] > 0.8){draw_sprite_ext(spr_snow_2dig, 0, x+(i*tileSize), y+(j*tileSize), xscale, yscale, image_angle, image_blend, image_alpha);}       
    }

}
