//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vWorldPos;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vWorldPos = gm_Matrices[MATRIX_WORLD] * object_space_pos;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Displacement texture shader, made for water
// 2nd version has double displacement
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vWorldPos;

uniform sampler2D uDisplacementMap;
uniform float uTime;
uniform float uDistort;
/// Displacement vars
uniform float uDisplacementDir;
uniform float uDisplacementDirDiff;
uniform float uDisplacementSpd;
uniform float uDisplacementScale;
/// Texture vars
uniform float uTextureDir;
uniform float uTextureSpd;
uniform float uTextureScale;

/* Returns a vec2 direction based on a given angle in degrees. */
vec2 deg2vec(float angleDeg)
{
    float angleRad = radians(angleDeg);
    return vec2(cos(angleRad), sin(angleRad));
}

void main()
{
    // displacement 1
    vec2 displaceTimeOffset = deg2vec(uDisplacementDir) * uTime*uDisplacementSpd;
    vec4 displacementTexture = texture2D(uDisplacementMap, v_vTexcoord*uDisplacementScale + displaceTimeOffset);
    float brightness = displacementTexture.r-0.5; // range [-0.5,0.5]
    vec2 displacementOffset = vec2(brightness*uDistort); //base texture scrolling
    // displacement 2
    vec2 displaceTimeOffset2 = deg2vec(uDisplacementDir + uDisplacementDirDiff) * uTime*uDisplacementSpd;
    vec4 displacementTexture2 = texture2D(uDisplacementMap, v_vTexcoord*(uDisplacementScale) + displaceTimeOffset2);
    float brightness2 = displacementTexture2.r-0.5;
    vec2 displacementOffset2 = vec2(brightness2*uDistort); 
    
    // base texture
    vec2 textureOffset = deg2vec(uTextureDir) * uTime*uTextureSpd;
    
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord*uTextureScale + displacementOffset + displacementOffset2 + textureOffset);
}
