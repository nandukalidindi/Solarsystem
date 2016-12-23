attribute vec4 position;
attribute vec4 normal;
attribute vec2 texCoord;
attribute vec4 binormal;
attribute vec4 tangent;

varying mat3 varyingTBNMatrix;

uniform vec4 timeUniform;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 normalMatrix;

varying vec3 varyingNormal;
varying vec3 varyingPosition;
varying vec2 varyingTexCoord;

void main() {
    varyingTBNMatrix = mat3(normalize((normalMatrix * tangent).xyz),
                            normalize((normalMatrix * binormal).xyz),
                            normalize((normalMatrix * normal).xyz));
    
    varyingTexCoord = texCoord;
    varyingNormal = normalize((normalMatrix * normal).xyz);
    vec4 p = modelViewMatrix * position;
    varyingPosition = p.xyz;
    gl_Position = projectionMatrix * p;
}