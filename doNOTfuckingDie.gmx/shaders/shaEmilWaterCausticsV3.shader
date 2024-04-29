attribute vec3 in_Position; 
varying vec2 fragCoord; 
 void main() 
 {
    vec4 Position = vec4( in_Position, 1); 
   gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * Position; 
   fragCoord = in_Position.xy; 
 }
//######################_==_YOYO_SHADER_MARKER_==_######################@~/// https://www.shadertoy.com/view/4slBWN
// Caustics: study of light in the water
uniform float iGlobalTime; 
uniform float iResolution; 
varying vec2 fragCoord; 
float timeSpeed = 2.0;

float randomVal (float inVal)
{
    return fract(sin(dot(vec2(inVal, 2523.2361) ,vec2(12.9898,78.233))) * 43758.5453)-0.5;
}

vec2 randomVec2 (float inVal)
{
    return normalize(vec2(randomVal(inVal), randomVal(inVal+151.523)));
}

float makeWaves(vec2 uv, float theTime, float offset)
{
    float result = 0.0;
    float direction = 0.0;
    float sineWave = 0.0;
    vec2 randVec = vec2(1.0,0.0);
    float i;
    for(int n = 0; n < 16; n++)
    {
        i = float(n)+offset;
        randVec = randomVec2(float(i));
  direction = (uv.x*randVec.x+uv.y*randVec.y);
        sineWave = sin(direction*randomVal(i+1.6516)+theTime*timeSpeed);
        sineWave = smoothstep(0.0,1.0,sineWave);
    result += randomVal(i+123.0)*sineWave;
    }
    return result;
}

void main( void )
{
vec2 uv = fragCoord.xy / iResolution;
    
    vec2 uv2 = uv * 150.0; // scale
    
    uv *= 2.0;
    /*
    uv2 *= (0.9+iMouse.y*0.01);
    uv *= (0.9+iMouse.y*0.01);
*/
    
    float result = 0.0;
    float result2 = 0.0;
    
    result = makeWaves( uv2+vec2(iGlobalTime*timeSpeed,0.0), iGlobalTime, 0.1);
    result2 = makeWaves( uv2-vec2(iGlobalTime*0.8*timeSpeed,0.0), iGlobalTime*0.8+0.06, 0.26);
    
    //result *= 2.6;
    
    result = smoothstep(0.4,1.1,1.0-abs(result));
    result2 = smoothstep(0.4,1.1,1.0-abs(result2));
    
    result = 2.0*smoothstep(0.35,1.8,(result+result2)*0.5);
    
//gl_FragColor = vec4(result)*0.7+texture2D( gm_BaseTexture , uv );
    
    // thank for this code below Shane!
    vec2 p = vec2(result, result2)*.015 + sin(uv*16. - cos(uv.yx*16. + iGlobalTime*timeSpeed))*.015; // Etc.
gl_FragColor = vec4(result)*0.7+texture2D( gm_BaseTexture , uv + p );
}

