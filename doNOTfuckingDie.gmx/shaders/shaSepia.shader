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

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
   gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );

    float BnW = ( gl_FragColor.r + gl_FragColor.g +gl_FragColor.b) / 3.0;
    
    //playing with the three numbers here will give the tint.
    vec4 sepiaCol = vec4(BnW * vec3(1.2,1.0,0.8), 1.0);
    
    gl_FragColor = sepiaCol;
}

