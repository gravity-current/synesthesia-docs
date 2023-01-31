# Transitioning from Other GLSL Environments

## Uniforms

Description | Synesthesia | Shadertoy | ISF
------------ | -------------
The width and height in pixels | `vec2 RENDERSIZE` | `vec3 iResolution` | `vec2 RENDERSIZE`
The index of the current pass | `int PASSINDEX` | N/A - code is written in separate buffers | `int PASSINDEX`
`float TIME` | The time in seconds since the scene started rendering.
`float FRAMECOUNT` | The number of frames since the scene started rendering.
`vec2 _xy` | The current position of the pixel. Equivalent to `gl_FragCoord.xy`.
`vec2 _uv` | The current *normalized* position of the pixel. Equivalent to `gl_FragCoord.xy / RENDERSIZE`.
`vec2 _uvc` | The current normalized position of the pixel *with aspect ratio correction*, such that `(0,0)` will be in the center of the screen. A circle drawn with these coordinates will not appear stretched.
`const float PI` | 3.14159...


Shadertoy:
uniform vec3 iResolution;
uniform float iTime;
uniform float iTimeDelta;
uniform float iFrame;
uniform float iChannelTime[4];
uniform vec4 iMouse;
uniform vec4 iDate;
uniform float iSampleRate;
uniform vec3 iChannelResolution[4];
uniform samplerXX iChanneli