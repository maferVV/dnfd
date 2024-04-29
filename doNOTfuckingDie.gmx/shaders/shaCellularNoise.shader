//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 uDimensions;
uniform float uPitch;
/*
void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}*/

void main()
{
    gl_Position = vec4(in_Position.xy, 0., 1.);
    v_vTexcoord = uDimensions * (in_Position.xy + 1.) * .5;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float uTime;
uniform float uPitch;
uniform vec2 uResolution;
uniform float uScale;

float rand(vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}
void main()
{
    vec2 spd = vec2(uTime, uTime)*2.0;
    float aspectRatio = uResolution.x/uResolution.y;
    float d1 = 1.;
    float d2 = 1.;
    vec2 pos = v_vTexcoord * uScale; // units of ~1
    vec2 cell = floor(pos);
    // iterate through surrounding grids
    for (int xx = -1; xx <= 1; xx ++)
    {
        for (int yy = -1; yy <= 1; yy ++)
        {
            
            vec2 cellPos = vec2(cell + vec2(xx, yy));
            vec2 blobPos = vec2( rand(cellPos), rand(cellPos) );
            // Animate the blob
            blobPos = 0.532 + 0.5*sin(uTime + 6.2831*blobPos);
            float dist = distance(pos, cellPos + blobPos);
            if (dist < d1) // dist is the new nearest point
            {
                d2 = d1;
                d1 = dist;
            }
            else if (dist < d2)
            {
                d2 = dist;
            }
        }
    }
    float rel = d1 / d2;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor += vec4(vec3(step(.9, rel)), 1.);
    //gl_FragColor.r += step(0.98, fract(pos).x) + step(0.98, fract(pos).y);
}
