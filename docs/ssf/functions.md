# SSF Functions

When a scene is compiled, Synesthesia includes a host of custom functions to make scene writing easier and more powerful.

## Math

### `_scale()`

Scales a value within the range `0` to `1` to the new range `min` to `max`
```glsl
float scaledValue = _scale(float value, float min, float max);
```

**Params**

- value <code>float</code> - the value to be scaled
- min <code>float</code> - the lower bound for scaling
- max <code>float</code> - the upper bound for scaling

**Returns**: <code>float</code> - the scaled value  

### `_smin()`

Similar to `min(float, float)`, but creates a smooth transition between the two values
([from Inigo Quilez](https://iquilezles.org/www/articles/smin/smin.htm))
```glsl
float smoothMin = _smin(float a, float b, float k);
```

**Params**

- a <code>float</code> - the first value to compare
- b <code>float</code> - the second value to compare
- k <code>float</code> - the exponent on the algorithm. Higher values means a sharper transition

**Returns**: <code>float</code> - the smooth minimum of the two values  

### `_rand()`

Generates a pseudo-random value based on a seed
```glsl
float randomValue = _rand(float seed);
float randomValue = _rand(vec2 seed);
```

**Params**

- seed <code>float</code> | <code>vec2</code> - the seed used to generate a random value

**Returns**: <code>float</code> - a pseudo-random value ranging from `0` to `1`  

### `_pulse()`

Generates a smooth pulse with a specific center and size. Useful for creating smooth transitions in value 
across space (using `_uv` as position) or time (using a dynamic variable as position)
```glsl
float pulseValue = _pulse(float position, float center, float size);
```

**Params**

- position <code>float</code> - the place within the pulse to sample (ranges from `0` to `1`)
- center <code>float</code> - the centerpoint of the pulse within the range `0` to `1`
- size <code>float</code> - the width or duration of the pulse

**Returns**: <code>float</code> - the value of the pulse at the given position

**Example**  
```js
// A spatial pulse, generating a gradient that moves back and forth across the screen 
return vec4(_pulse(_uv.x, sin(TIME)*0.5+0.5, 0.5));
// A temporal pulse, generating a ramp of color that peaks every second
return vec4(_pulse(fract(TIME), 1.0, 0.5));
```

### `_sqPulse()`

Generates a square pulse with a specific center and size. Useful for creating sharp transitions in value 
across space (using `_uv` as position) or time (using a dynamic variable as position)
```glsl
float pulseValue = _pulse(float position, float center, float size);
```

**Params**

- position <code>float</code> - the place within the pulse to sample (ranges from `0` to `1`)
- center <code>float</code> - the centerpoint of the pulse within the range `0` to `1`
- size <code>float</code> - the width or duration of the pulse

**Returns**: <code>float</code> - the value of the pulse at the given position  

### `_triWave()`

Generates a triangle wave with a specific period. Useful for creating linear, periodic changes in value 
across space (using `_uv` as position) or time (using a dynamic variable as position)
```glsl
float wave = _triWave(float position, float period);
```

**Params**

- position <code>float</code> - the place within the wave to sample.
- period <code>float</code> - the duration/width/frequency of the wave

**Returns**: <code>float</code> - the value of the wave at the given position, ranging from `-0.5` to `0.0`  

### `_pixelate()`

Clusters/quantizes values into larger "pixels"

```glsl
float pixelatedValue = _pixelate(float value, float amount);
vec2 pixelatedValue = _pixelate(vec2 value, float amount);
vec3 pixelatedValue = _pixelate(vec3 value, float amount);
```

**Params**

- value <code>float</code> | <code>vec2</code> | <code>vec3</code> - the value to pixelate
- amount <code>float</code> - the number of available clusters within the range `0.0` to `1.0`

**Returns**: <code>float</code> \| <code>vec2</code> \| <code>vec3</code> - the pixelated value

**Example**  
```js
// With an amount of 5, any input in the range 0-1 will be set to 1 of 5 values
_pixelate(0.2, 5);           // returns 0.2
_pixelate(0.456, 5);         // returns 0.4
_pixelate({0.3, 0.314}, 10); // returns {.3, .3}
```

## Noise

### `_noise()`

Creates 1D, 2D, or 3D noise based on a seed. Useful for creating smooth, unpredictable variance 
across space (using `_uv` as seed) or time (using a dynamic variable as seed)
```glsl
float noise = _noise(float seed);
float noise = _noise(vec2 seed);
float noise = _noise(vec3 seed);
```

**Params**

- seed <code>float</code> | <code>vec2</code> | <code>vec3</code> - the seed used to generate the noise value. Similar seeds will produce similar values, unlike `_rand()`

**Returns**: <code>float</code> - a noise value in the range `0` to `1`  

### `_fbm()`

Creates 1D, 2D, or 3D fractal noise, using fractal/fractional Brownian motion ([learn more](https://thebookofshaders.com/13/)). Generates more complex (but more expensive) noise than `_noise()`,
which looks self-similar at all scales
```glsl
float noise = _fbm(float seed);
float noise = _fbm(vec2 seed);
float noise = _fbm(vec3 seed);
```

**Params**

- seed <code>float</code> | <code>vec2</code> | <code>vec3</code> - the seed used to generate the noise value

**Returns**: <code>float</code> - a noise value in the range `0` to `1`  

### `_statelessContinuousChaotic()`

Produces stateless, noiselike behaviour given a steadily increasing input (like `TIME`)
```glsl
float chaotic = _statelessContinuousChaotic(float time);
```

**Params**

- time <code>float</code> - a steadily increasing value (like the `TIME` uniform)

**Returns**: <code>float</code> - a continuously changing, noiselike value  

## Coordinates

### `_uv2uvc()`

Transforms `_uv` coordinates (with origin at the bottom left) to `_uvc` coordinates (with origin at the center of the screen)

**Directly modifies the input vector as an `inout` parameter**
```glsl
_uv2uvc(vec2 position);
```

**Params**

- position <code>vec2</code> - the coordinates to be transformed


### `_uvc2uv()`

Transforms `_uvc` coordinates (with origin at the center of the screen) to `_uv` coordinates (with origin at the bottom left)

**Directly modifies the input vector as an `inout` parameter**
```glsl
_uvc2uv(vec2 position);
```

**Params**

- position <code>vec2</code> - the coordinates to be transformed


### `_rotate()`

Rotates a vector around the point `(0, 0)`

```glsl
vec2 rotatedVector = _rotate(vec2 vector, float theta);
```

**Params**

- vector <code>vec2</code> - the vector to be rotated
- theta <code>float</code> - the degrees to rotate

**Returns**: <code>vec2</code> - the rotated vector  

### `_toPolar()`

Converts a cartesian vector `(x, y)` into a polar vector `(radius, theta)`
```glsl
vec2 polarVector = _toPolar(vec2 xy);
```

**Params**

- xy <code>vec2</code> - the cartesian vector to convert to polar coordinates

**Returns**: <code>vec2</code> - a polar vector in the form `(radius, theta)`  

### `_toPolarTrue()`

Converts a cartesian vector `(x, y)` into a polar vector `(radius, theta)` with quadrant correction applied, giving full range of rotation
```glsl
vec2 polarVector = _toPolarTrue(vec2 xy);
```

**Params**

- xy <code>vec2</code> - the cartesian vector to convert to polar coordinates

**Returns**: <code>vec2</code> - a polar vector in the form `(radius, theta)`  

### `_toRect()`

Converts a polar vector `(radius, theta)` into a cartesian vector `(x, y)`
```glsl
vec2 cartesianVector = _toRect(vec2 rt);
```

**Params**

- rt <code>vec2</code> - the polar vector to convert to cartesian coordinates

**Returns**: <code>vec2</code> - a cartesian vector in the form `(x, y)`  


## Color


### `_rgb2hsv()`

Converts an RGB color vector into an equivalent HSV color vector
```glsl
vec3 hsv = _rgb2hsv(vec3 rgb);
```

**Params**

- rgb <code>vec3</code> - a color vector in the form `(red, green, blue)`

**Returns**: <code>vec3</code> - a color vector in the form `(hue, saturation, value)`  

### `_hsv2rgb()`

Converts an HSV color vector into an equivalent RGB color vector
```glsl
vec3 rgb = _hsv2rgb(vec3 hsv);
```

**Params**

- hsv <code>vec3</code> - a color vector in the form `(hue, saturation, value)`

**Returns**: <code>vec3</code> - a color vector in the form `(red, green, blue)`  

### `_normalizeRGB()`

Converts an RGB color vector in the range `0` to `255` to a vector in the range `0.0` to `1.0`
```glsl
vec3 normalizedRGB = _normalizeRGB(vec3 rgb);
```

**Params**

- RGB <code>vec3</code> - a color vector in the range `0` to `255`

**Returns**: <code>vec3</code> - a vector with components in the range `0.0` to `1.0`  

### `_palette()`

Returns a color within a palette generated by a cosine function 
([from Inigo Quilez](https://iquilezles.org/www/articles/palettes/palettes.htm))

```glsl
vec3 paletteColor = _palette(float index, vec3 biases, vec3 amps, vec3 freqs, vec3 phases);
```

**Params**

- index <code>float</code> - the place within the palette to sample a color. Generally ranges from `0.0` to `1.0` (but doesn't need to)
- biases <code>vec3</code> - the RGB biases in the form `(redBias, greenBias, blueBias)`
- amps <code>vec3</code> - the RGB amplitudes in the form `(redAmp, greenAmp, blueAmp)`
- freqs <code>vec3</code> - the RGB frequencies in the form `(redFreq, greenFreq, blueFreq)`
- phases <code>vec3</code> - the RGB phase offsets in the form `(redPhase, greenPhase, bluePhase)`

**Returns**: <code>vec3</code> - a color within the generated palette  

## Media

### `_loadUserImage()`

Loads the color of the selected user media at the current pixel, optionally adjusted by an offset.

```glsl
vec4 userImageColor = _loadUserImage();
vec4 userImageColor = _loadUserImage(vec2 offset);
```

**Params**

- [offset] <code>vec2</code> - the offset from the current pixel to sample the texture

**Returns**: <code>vec4</code> - the color of the user media at the current pixel (adjusted by offset)

### `_textureUserImage()`

Samples user media at custom uv coordinates. It is important to use this function instead of the standard `texture()` function, since it handles all of Synesthesia's media effects and correction. 

**NOTE**: While `_loadUserImage()` includes aspect-ratio correction so the user media does not appear stretched, this function does not. You can use the `_correctUserImageCoords()` function to correct for this.


```glsl
vec4 userImageColor = _textureUserImage(vec2 uv);
```

**Params**

- uv <code>vec2</code> - the uv coordinates at which to sample the user media (should be in the range 0-1)

**Returns**: <code>vec4</code> - the color of the user media at the given uv coordinates

### `_loadUserImageAsMask()`

Loads the selected user media at the current pixel as a mask, with values thresholded to be either `0.0` or `1.0`.
By multiplying a color vector by one of the output channels (`r`, `g`, and `b` are the same), you can mask the color
to only appear when the user image is prominent.
```glsl
vec4 userImageMask = _loadUserImageAsMask();
vec4 userImageMask = _loadUserImageAsMask(vec2 offset);
```

**Params**

- [offset] <code>vec2</code> - the offset from the current pixel to sample the texture

**Returns**: <code>vec4</code> - the thresholded color of the user media at the current pixel (adjusted by offset). Either `vec4(0.0)` or `vec4(1.0)`  

### `_textureUserImageAsMask()`

Samples user media at the given coordinates as a mask, with values thresholded to be either `0.0` or `1.0`. By multiplying a color vector by one of the output channels (`r`, `g`, and `b` are the same), you can mask the color to only appear when the user image is prominent.

```glsl
vec4 userImageMask = _textureUserImageAsMask(vec2 uv);
```

**Params**

- uv <code>vec2</code> - the uv coordinates at which to sample the user media (should be in the range 0-1)

**Returns**: <code>vec4</code> - the thresholded color of the user media at the given coordinates. Either `vec4(0.0)` or `vec4(1.0)`

### `_correctUserImageCoords()`

Correct the aspect ratio of uv coordinates so they can be used to sample user media without appearing stretched. It scales the coordinates based on the aspect ratio of `sampler2D syn_UserImage`, which stores user media.

```glsl
vec2 aspectCorrectedCoords = _correctUserImageCoords(vec2 uv);
```

**Params**

- uv <code>vec2</code> - the uv coordinates to correct

**Returns**: <code>vec4</code> - the uv coordinates corrected for aspect ratio

### `_isMediaActive()`

Returns whether a user has selected media in the media panel.

```glsl
bool isMediaActive = _isMediaActive();
```

**Returns**: <code>bool</code> - `true` if media is selected and `false` if "none" is selected

### `_exists()`

Determines if a texture exists. Use this function to check if user media has been selected
```glsl
bool doesSamplerExist = _exists(sampler2D texture);
```

**Params**

- texture <code>sampler2D</code> - the texture variable to check

**Returns**: <code>bool</code> - `true` if the texture exists, `false` if it does not  

**Example**  
```js
// Check if media has been selected using the syn_UserImage 2Dsampler uniform
if (_exists(syn_UserImage)) {
  color *= _loadUserImageAsMask().r;
}
```
