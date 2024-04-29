//
// Simple passthrough vertex shader.
// Documented by Felipe.
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

/// variables passed into Fragment shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    // Why vec4? The 4th element is a convention in linear algebra:
        // 1.0: vec is a point
        // 0.0: vec is an actual vector
    // We also need a 4x4 to multiply by MATRIX_WORLD_VIEW_PROJECTION which is 4x4.
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    // gl_Position is the output.
        // It defines the final position of the vectors in the screen.
    // gm_Matrices is a GMS array of special matrices.
    // This multiplication will project the world position of the vertex into screen coordinates.
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    // Pass the color of each vertex (corner in sprite)
    v_vColour = in_Colour;
    // Pass the coordinate in the texture page (0,0) to (1,1)
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
// Also called pixel shader
//

/// Passed variables from Vertex shader.
// In this context v_vTextcoord is the specific x,y of the pixel.
varying vec2 v_vTexcoord;
// In this context v_vColour is the interpolated pixel color between the 4 corners.
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

