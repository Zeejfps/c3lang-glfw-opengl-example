module glfw_probe;
import std::io;
import glfw;
import gl;

fn void main(String[] args)
{
    glfw::init();
    defer glfw::terminate();
    
    GLFWwindow* window = glfw::createWindow(640, 480, "Hello World");
    defer glfw::destroyWindow(window);
    window.makeContextCurrent();
    
    gl::load(&glfw::getProcAddress);
    gl::clearColor(1, 0, 0, 1);
        
    while (!window.shouldClose()) {
        gl::clear(gl::COLOR_BUFFER_BIT | gl::DEPTH_BUFFER_BIT);
        window.swapBuffers();
        glfw::pollEvents();
    }
}