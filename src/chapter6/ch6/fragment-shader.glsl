#version 330 core
out vec4 FragColor;

in vec4 vertexColor; // input variable from vs (same name and type)
uniform vec4 ourColor; // we set this variable in the OpenGL code.

void main() {
    // FragColor = vertexColor;  // Using the output from the vertex-shader.glsl
    FragColor = ourColor;   // Using the uniform
}
