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

uniform float lensSize; //set by shader_set_uniform_f(shader_get_uniform(FishEye,"lensSize"),xx.x); 
uniform float apertureAngle; //set by shader_set_uniform_f(shader_get_uniform(FishEye,"apertureAngle"),xx.x); 
const float PI = 3.1415926535;

const float nudge = 0.15; //to make things a little more interesting

void main(void) {    
  float apertureHalf =0.5*apertureAngle * (PI / 180.0);

  float maxFactor = sin(apertureHalf); //compensate for <180 lensSize
  
  vec2 pos = 2.0 * v_vTexcoord.st - 1.0; //take from centre - use this to adjust position
  
  float l = length(pos);//distance from positon
  if (l > lensSize) { //if its outside the distance render as normal
    gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord) *v_vColour;
  } else {
    float x = maxFactor * pos.x;
    float y = maxFactor * pos.y;
    
    float n = length(vec2(x, y));
    
    float z = sqrt(lensSize-(nudge) - n * n);
  
    float r = atan(n, z) / PI; 
  
    float phi = atan(y, x);

    //imagine moving your head left and right looking through a peephole
    //changing the hardcoded Fudge factor here gives that effect
    float u = r * cos(phi) + 0.5; //left right
    float v = r * sin(phi) + 0.5; //up down

    gl_FragColor = texture2D(gm_BaseTexture, vec2(u, v)) * v_vColour;
  }
}

