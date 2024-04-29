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

uniform float maxBlurStrength; //set by shader_set_uniform_f(shader_get_uniform(OuterBlur,"maxBlurStrength"),xx.x); 
uniform float resolution; //set by shader_set_uniform_f(shader_get_uniform(OuterBlur,"resolution"),xx.x); 
uniform float radius; //set by shader_set_uniform_f(shader_get_uniform(OuterBlur,"radius"),xx.x); 
uniform vec2 dir; //set by shader_set_uniform_f(shader_get_uniform(OuterBlur,"dir"),x,y); 


void main() {
    //this will be our RGBA sum
    vec4 col = vec4(0.0);

    //our original texcoord for this fragment
    vec2 uv = v_vTexcoord;

    vec2 pos = 2.0 * v_vTexcoord.st - 1.0; //take from centre - use this to adjust position you could evn pass something in
    float l = length(pos);
    if(l > radius){
        //the amount to blur, i.e. how far off center to sample from 
        float blur = ((l-radius)*maxBlurStrength) /resolution; //intensity based on distance past radius
    
        //the direction of our blur
        float hstep = dir.x;
        float vstep = dir.y;
    
        //apply blurring, using a 9-tap filter with magic numbers
 
        col += texture2D(gm_BaseTexture, vec2(uv.x - 4.0*blur*hstep, uv.y - 4.0*blur*vstep)) * 0.02; //furthest
        col += texture2D(gm_BaseTexture, vec2(uv.x - 3.0*blur*hstep, uv.y - 3.0*blur*vstep)) * 0.05;
        col += texture2D(gm_BaseTexture, vec2(uv.x - 2.0*blur*hstep, uv.y - 2.0*blur*vstep)) * 0.12;
        col += texture2D(gm_BaseTexture, vec2(uv.x - 1.0*blur*hstep, uv.y - 1.0*blur*vstep)) * 0.20; //closest
    
        col += texture2D(gm_BaseTexture, vec2(uv.x, uv.y)) * 0.23;
    
        col += texture2D(gm_BaseTexture, vec2(uv.x + 1.0*blur*hstep, uv.y + 1.0*blur*vstep)) * 0.19; //closest
        col += texture2D(gm_BaseTexture, vec2(uv.x + 2.0*blur*hstep, uv.y + 2.0*blur*vstep)) * 0.12;
        col += texture2D(gm_BaseTexture, vec2(uv.x + 3.0*blur*hstep, uv.y + 3.0*blur*vstep)) * 0.05;
        col += texture2D(gm_BaseTexture, vec2(uv.x + 4.0*blur*hstep, uv.y + 4.0*blur*vstep)) * 0.02; //furthest
        //multiply by vertex color and return
        gl_FragColor = v_vColour * vec4(col.rgba);
    }
    else { //render as normal
       gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord) *v_vColour;
    }
}

