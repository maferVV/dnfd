//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~// based on:
// https://github.com/mattdesl/glsl-lut

/*-----------------------------------------------------------------------------
LUT Shader: remaps colours based on a LUT map
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
This shader code is based on:
https://github.com/mattdesl/glsl-lut

Some interactive explanation on LUT maps can be found on itchi-io:
https://reverend-greg.itch.io/lut-colouring-explained

-------------------------------------------------------------------------------

A LUT shader remaps each colour to a specfic other colour. So i.e.:
RGB (072, 217, 011)
will become:
RGB (188, 217, 171)

But instead of using maths to remap it's using a LUT.


A LUT usually has 8x8 cells:

Each cells RED value is 0 on the left side and 1 at the right side.

Each cells GREEN value is 0 on the top and 1 at the bottom.

Each cells BLUE value is the same within the cell. But the first cell (the one
in the top-left of the LUT) has a blue value of 0, then the next cells blue
value is a bit lighter and the the last cells blue value is 1.
Like this every colour is represented within the LUT.

But since there are not 255 cells there's not 255 blue values. And since the
cells are not 255 pixels wide or high, there aren't 255 red or green values.
In this map there's 64 values for each colour. Any colour value in between is
created by interpolating colours.

How this works:

- Get the original sample from the image you're drawing.

- Calculate where on a standard LUT that colour would be.

- Take a sample from that position on the LUT you want to apply and draw that
  instead of the original sample.";

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
uniform float		strength
					0 <= strength <= 1
					mix amount to mix the base colour with the LUT colour
					0: show base colour
					1: show LUT colour
					
uniform sampler2D	lut_tex
					texture ID of the LUT map
					The map needs to be square, on a separate texture page and
					its sides need to be 2 to the power of n.

_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Create event:
---------------------------------------
shader		= shd_lut64_square;
u_strength	= shader_get_uniform(shader, "strength");
u_lut_tex	= shader_get_sampler_index(shader, "lut_tex");
lut_tex		= sprite_get_texture(spr_lut, 0);
	
Draw event:
---------------------------------------
shader_set(shader);
	shader_set_uniform_f(u_strength, strength);
	texture_set_stage(u_lut_tex, lut_tex);
	draw_sprite(spr_foto, 0, x, y);
shader_reset();

*/

varying vec2 			v_vTexcoord;
varying vec4 			v_vColour;

uniform float 			strength;
uniform sampler2D 		lut_tex;

// Set these manually:
//-------------------------------------------------------------------------
//      TEX_SIZE_IN_PX	512.0		// size of the LUT-texture in pixels
#define CELLS_PER_ROW	8.0			// number of LUT-cells per row on the LUT-texture
#define CELL_SIZE		0.125		// = 1.0 / CELLS_PER_ROW
#define HALF_TEXEL_SIZE	0.000976562	// = 0.5 / TEX_SIZE_IN_PX
#define CELL_SIZE_FIXED	0.123046875	// = CELL_SIZE - (2 * HALF_TEXEL_SIZE)


void main() {
	// BASE:
	//-------------------------------------------------------------------------
    vec4 base_col	= texture2D(gm_BaseTexture, v_vTexcoord);
    float blue_cell	= base_col.b * (CELLS_PER_ROW * CELLS_PER_ROW - 1.0);
	
	
	// SMAPLE COORDS:
	//-------------------------------------------------------------------------
    vec2 lower_cell, lower_sample, upper_cell, upper_sample;
	lower_cell.y	= floor(blue_cell / CELLS_PER_ROW); // floor(floor(blue_cell) / CELLS_PER_ROW);
    lower_cell.x	= floor(blue_cell) - lower_cell.y * CELLS_PER_ROW;
    lower_sample.x	= lower_cell.x * CELL_SIZE    + HALF_TEXEL_SIZE    + CELL_SIZE_FIXED * base_col.r;
    lower_sample.y	= lower_cell.y * CELL_SIZE    + HALF_TEXEL_SIZE    + CELL_SIZE_FIXED * base_col.g;
	
    upper_cell.y	= floor(ceil(blue_cell) / CELLS_PER_ROW);
    upper_cell.x	= ceil(blue_cell) - upper_cell.y * CELLS_PER_ROW;
    upper_sample.x	= upper_cell.x * CELL_SIZE    + HALF_TEXEL_SIZE    + CELL_SIZE_FIXED * base_col.r;
    upper_sample.y	= upper_cell.y * CELL_SIZE    + HALF_TEXEL_SIZE    + CELL_SIZE_FIXED * base_col.g;
	
	
	// OUTPUT:
	//-------------------------------------------------------------------------
    vec3 out_col	= mix(texture2D(lut_tex, lower_sample).rgb, texture2D(lut_tex, upper_sample).rgb, fract(blue_cell)); 
    	out_col			= mix(base_col.rgb, out_col, strength);
    gl_FragColor	= v_vColour * vec4(out_col, base_col.a);
}

