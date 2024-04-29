//Vertex shader:
attribute vec2 in_Position;                  // (x,y,z)
varying vec2 v_vTexcoord;
uniform vec2 dimensions;
void main()
{
    gl_Position = vec4(in_Position, 0., 1.);
    v_vTexcoord = dimensions * (in_Position + 1.) * .5;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float rand(vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}
void main()
{
    float d1 = 1.;
    float d2 = 1.;
    vec2 pos = v_vTexcoord / 64.;
    vec2 cell = floor(pos);
    for (int xx = -1; xx <= 1; xx ++)
    {
        for (int yy = -1; yy <= 1; yy ++)
        {
            vec2 cellPos = vec2(cell + vec2(xx, yy));
            vec2 blobPos = vec2(rand(cellPos), rand(cellPos + 33.3333));
            float dist = distance(pos, cellPos + blobPos);
            if (dist < d1)
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
    
    gl_FragColor = vec4(vec3(step(.9, rel)), 1.);
}
