//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 leftC; // sample coordinate offsets  
varying vec2 rightC; // sample coordinate offsets 
varying vec2 upC; // sample coordinate offsets 
varying vec2 downC; // sample coordinate offsets 

//increasing the number of sample coords will improve the edge detection


float d = 0.005; //"stroke" width

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
            
    leftC = v_vTexcoord.xy + vec2(-d , 0);
    rightC = v_vTexcoord.xy + vec2(d , 0);
    upC = v_vTexcoord.xy + vec2(0,d);
    downC = v_vTexcoord.xy + vec2(0,-d);

}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 leftC; // Texture coordinate offsets  
varying vec2 rightC; // Texture coordinate offsets 
varying vec2 upC; // Texture coordinate offsets 
varying vec2 downC; // Texture coordinate offsets 


void main()
    {
      
    gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor.a = 1.0; //Best to make sure nothing seems transparent
    
    vec2 c = v_vTexcoord.xy;
    vec4 colour = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 colourL = texture2D(gm_BaseTexture, leftC);
    vec4 colourR = texture2D(gm_BaseTexture, rightC);
    vec4 colourU = texture2D(gm_BaseTexture, upC);
    vec4 colourD = texture2D(gm_BaseTexture, downC);
    
    gl_FragColor = (colourL + colourR +colourU + colourD ) - (4.0 *colour);
    gl_FragColor = vec4(gl_FragColor.r, gl_FragColor.r, gl_FragColor.r, 1.0);
    gl_FragColor.a = 1.0; 
    

}

