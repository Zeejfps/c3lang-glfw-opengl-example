module glfw;

def GLFWwindow = CInt;
def GLFWmonitor = CInt;
def GLFWglproc = void*;

// Public functions
fn bool GLFWwindow.shouldClose(GLFWwindow* this) {
    return glfwWindowShouldClose(this) > 0;
}

fn void GLFWwindow.swapBuffers(GLFWwindow* this) {
    glfwSwapBuffers(this);
}

fn void GLFWwindow.makeContextCurrent(GLFWwindow* this) {
    glfwMakeContextCurrent(this);
}

fn void init() {
    glfwInit();
}

fn void terminate() {
    glfwTerminate();
}

fn GLFWwindow* createWindow(int width, int height, char* title) {
    return glfwCreateWindow((CInt)width, (CInt)height, title, null, null);
}

fn void destroyWindow(GLFWwindow* window) {
    glfwDestroyWindow(window);
}

fn void pollEvents() {
    glfwPollEvents();
}

fn GLFWglproc getProcAddress(char* procName) {
    return glfwGetProcAddress(procName);
}

// FFI
extern fn CInt glfwInit() @private;
extern fn void glfwTerminate() @private;
extern fn void glfwPollEvents() @private;	
extern fn GLFWglproc glfwGetProcAddress(char* procname) @private;	

// Window
extern fn GLFWwindow* glfwCreateWindow(CInt width, CInt height, char* title, GLFWmonitor* monitor, GLFWwindow* share) @private;
extern fn CInt glfwWindowShouldClose(GLFWwindow* window) @private;
extern fn void glfwSwapBuffers(GLFWwindow* window) @private;	
extern fn void glfwDestroyWindow(GLFWwindow* window) @private;	
extern fn void glfwMakeContextCurrent(GLFWwindow* window) @private;	
