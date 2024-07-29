module gl;

def GLsizei = uint;
def GLuint = uint;
def GLclampf = float;
def GLbitfield = uint;
def GetProcAddress = fn void*(char* procName);

def GenBuffersProc = fn void(GLsizei n, GLuint* buffers) @private;
def ClearColorProc = fn void(
    GLclampf red,
 	GLclampf green,
 	GLclampf blue,
 	GLclampf alpha
) @private;
def ClearProc = fn void(GLbitfield mask) @private;

const GLbitfield COLOR_BUFFER_BIT = 0x00004000;
const GLbitfield DEPTH_BUFFER_BIT = 16384;

GenBuffersProc glGenBuffers @private;
ClearColorProc glClearColor @private;
ClearProc glClear @private;

fn void load(GetProcAddress getProcAddress) {
    glGenBuffers = (GenBuffersProc)getProcAddress("glGenBuffers");
    glClearColor = (ClearColorProc)getProcAddress("glClearColor");
    glClear = (ClearProc)getProcAddress("glClear");
}

fn void genBuffers(GLsizei n, GLuint* buffers) {
    glGenBuffers(n, buffers);
}

fn void clearColor( 
    GLclampf red,
    GLclampf green,
    GLclampf blue,
    GLclampf alpha) 
{
    glClearColor(red, green, blue, alpha);
}

fn void clear(GLbitfield clearFlags) {
    glClear(clearFlags);
}
