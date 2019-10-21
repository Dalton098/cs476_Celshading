precision mediump float;

attribute vec3 vPos;
attribute vec3 vNormal;

uniform mat4 uTMatrix;
uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat3 uNMatrix;

uniform vec3 uEye;

void main(void) {
    gl_Position = uPMatrix * uMVMatrix * uTMatrix * vec4(vPos, 1.0);

    vec3 N = normalize(uNMatrix * vNormal);
    vec3 x = (uTMatrix * vec4(vPos,1.0)).xyz;
    vec3 eyeX = normalize(uEye - x);

    if (dot(N,eyeX) > 0.0) {
        gl_Position[2] = 1.0e+8; 
    } 

}
