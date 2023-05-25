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

### `_mix3()`

Mixes between 3 values using a normalized mix value

```glsl
float mixedValue = _mix3(float val1, float val2, float val3, float mixVal);
vec2 mixedValue = _mix3(vec2 val1, vec2 val2, vec2 val3, float mixVal);
vec3 mixedValue = _mix3(vec3 val1, vec3 val2, vec3 val3, float mixVal);
vec4 mixedValue = _mix3(vec4 val1, vec4 val2, vec4 val3, float mixVal);
```

**Params**

- val1 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 1st value to mix
- val2 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 2nd value to mix
- val3 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 3rd value to mix
- mixVal <code>float</code> - the mix value within the range `0.0` to `1.0`

**Returns**: <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the mixed value

### `_mix4()`

Mixes between 4 values using a normalized mix value

```glsl
float mixedValue = _mix4(float val1, float val2, float val3, float val4, float mixVal);
vec2 mixedValue = _mix4(vec2 val1, vec2 val2, vec2 val3, vec2 val4, float mixVal);
vec3 mixedValue = _mix4(vec3 val1, vec3 val2, vec3 val3, vec3 val4, float mixVal);
vec4 mixedValue = _mix4(vec4 val1, vec4 val2, vec4 val3, vec4 val4, float mixVal);
```

**Params**

- val1 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 1st value to mix
- val2 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 2nd value to mix
- val3 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 3rd value to mix
- val4 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 4th value to mix
- mixVal <code>float</code> - the mix value within the range `0.0` to `1.0`

**Returns**: <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the mixed value

### `_mix5()`

Mixes between 5 values using a normalized mix value

```glsl
float mixedValue = _mix5(float val1, float val2, float val3, float val4, float val5, float mixVal);
vec2 mixedValue = _mix5(vec2 val1, vec2 val2, vec2 val3, vec2 val4, vec2 val5, float mixVal);
vec3 mixedValue = _mix5(vec3 val1, vec3 val2, vec3 val3, vec3 val4, vec3 val5, float mixVal);
vec4 mixedValue = _mix5(vec4 val1, vec4 val2, vec4 val3, vec4 val4, vec4 val5, float mixVal);
```

**Params**

- val1 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 1st value to mix
- val2 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 2nd value to mix
- val3 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 3rd value to mix
- val4 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 4th value to mix
- val5 <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the 5th value to mix
- mixVal <code>float</code> - the mix value within the range `0.0` to `1.0`

**Returns**: <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the mixed value

### `_nsin()`

Generates a sine wave with values normalized between 0 and 1
```glsl
float wave = _nsin(float valIn);
```

**Params**

- valIn <code>float</code> - the value inside of the `sin()` function

**Returns**: <code>float</code> - the value of the wave at the given position, ranging from `0` to `1` 
### `_ncos()`

Generates a cosine wave with values normalized between 0 and 1
```glsl
float wave = _ncos(float valIn);
```

**Params**

- valIn <code>float</code> - the value inside of the `sin()` function

**Returns**: <code>float</code> - the value of the wave at the given position, ranging from `0` to `1` 
### `_nclamp()`

clamps a given value between 0 and 1. useful to use with a `mix` function where a value over `1` can cause issues on certain GPUs.
```glsl
float clampedVal = _nclamp(float var);
vec2 clampedVal = _nclamp(vec2 var);
vec3 clampedVal = _nclamp(vec3 var);
vec4 clampedVal = _nclamp(vec4 var);
```

**Params**

- valIn <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the value inside of the `clamp()` function

**Returns**: <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the clamped value
### `_mapValue()`

Map a value inside of a given range to a new range, scaling the value linearly.
```glsl
float scaledValue = _mapValue(float value, float min, float max, float new_min, float new_max);
vec2 scaledValue = _mapValue(vec2 value, vec2 min, vec2 max, vec2 new_min, vec2 new_max);
vec3 scaledValue = _mapValue(vec3 value, vec3 min, vec3 max, vec3 new_min, vec3 new_max);
vec4 scaledValue = _mapValue(vec4 value, vec4 min, vec4 max, vec4 new_min, vec4 new_max);
```

**Params**

- value <code>float</code> - a value inside of the min and max range
- min <code>float</code> - the current min value
- max <code>float</code> - the current max value
- new_min <code>float</code> - the new min value
- new_max <code>float</code> - the new max value

**Returns**: <code>float</code> - the current value mapped to the new range

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

### `_hash{out}{in}()`

Takes the specified input shape and produces a hash for the specified output shape. 

```glsl
//1 dimensional hash
float hash = _hash11(float p);
float hash = _hash12(vec2 p);
float hash = _hash13(vec3 p);

//2 dimensional hash
vec2 hash = _hash21(float p);
vec2 hash = _hash22(vec2 p);
vec2 hash = _hash23(vec3 p);

//3 dimensional hash
vec3 hash = _hash31(float p);
vec3 hash = _hash32(vec2 p);
vec3 hash = _hash33(vec3 p);

//4 dimensional hash
vec4 hash = _hash41(float p);
vec4 hash = _hash42(vec2 p);
vec4 hash = _hash43(vec3 p);
vec4 hash = _hash44(vec4 p);

```

**Params**

- p <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the seed used to generate the hash value.

**Returns**: <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - a hash value in the range `0` to `1`  

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
vec3 normalizedRGB = _normalizeRGB(float r, float g, float b);
```

**Params**

- r <code>float</code> - a float in the range `0` to `255`
- g <code>float</code> - a float in the range `0` to `255`
- b <code>float</code> - a float in the range `0` to `255`

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

### `_grayScale()`

Converts an RGB or RGBA color vector into a grayscale vector based on the sRGB color space.
```glsl
vec3 grayscaleRGB = _grayScale(vec3 rgb, float intensity);
vec4 grayscaleRGBA = _grayScale(vec4 rgba, float intensity);
```

**Params**

- RGB <code>vec3</code> | <code>vec4</code> - a normalized color vector
- intensity <code>float</code> - a normalized value that determines how much to grayscale the given vector. a value of 1 will give full grayscale.

**Returns**: <code>vec3</code> | <code>vec4</code>- a grayscale vector in the form `(red, green, blue, (alpha))`
### `_diChrome()`

Converts an RGB or RGBA color vector into a two tone color.
```glsl
vec3 diChromeRGB = _diChrome(vec3 rgb, vec3 color1, vec3 color2);
vec4 diChromeRGBA = _diChrome(vec4 rgba, vec3 color1, vec3 color2);
```

**Params**

- RGB <code>vec3</code> | <code>vec4</code> - a normalized color vector
- color1 <code>vec3</code> - the first rgb color vector to re-color to
- color2 <code>vec3</code> - the second rgb color vector to re-color to

**Returns**: <code>vec3</code> | <code>vec4</code> - a color vector in the form `(red, green, blue, (alpha))`

### `_hueRotate()`

Rotates a given color around the hue wheel
```glsl
vec3 newColor = _hueRotate(vec3 rgb, float rot);
```

**Params**

- RGB <code>vec3</code> | <code>vec4</code> - a normalized color vector
- rot <code>float</code> - The rotation value in degrees

**Returns**: <code>vec3</code> - a color vector in the form `(red, green, blue)`


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

### `_edgeDetectUserImage()`

Detects edges of the selected user media inexpensively through a bilinear method.

```glsl
vec4 mediaEdges = _edgeDetectUserImage();
```

**Returns**: <code>vec4</code> - the color of the edges for the selected user media. This value is likely to be small

### `_edgeDetectSobelUserImage()`

Detects edges of the currently selected user media using the sobel method. More info oon the sobel operator [can be found here.](https://en.wikipedia.org/wiki/Sobel_operator).

```glsl
vec4 mediaEdges = _edgeDetectSobelUserImage();
```


**Returns**: <code>float</code> - a grayscale value corresponding to the edges of the currently selected media

## Multipass

### `_edgeDetectSynPass()`

Detects edges of a given texture or syn pass inexpensively through a bilinear method.

```glsl
vec4 passEdges = _edgeDetectSynPass(sampler2D texture);
```

**Params**

- texture <code>sampler2D</code> - the texture or syn pass to calculate the edges for

**Returns**: <code>vec4</code> - the color of the edges for the given texture. This value is likely to be small
cd C()`

Detects edges of a given texture or syn pass using the sobel method. More info oon the sobel operator [can be found here.](https://en.wikipedia.org/wiki/Sobel_operator).

```glsl
vec4 passEdges = _edgeDetectSobelSynPass(sampler2D texture);
```

**Params**

- texture <code>sampler2D</code> - the texture or syn pass to calculate the edges for

**Returns**: <code>float</code> - a grayscale value corresponding to the edges of the given texture

### `_grayScaleSynPass()`

Grayscales a given texture or syn pass

```glsl
vec4 userImage = _grayScaleSynPass(sampler2D texture, float intensity);
```

**Params**

- texture <code>sampler2D</code> - the texture or syn pass to grayscale
- intensity <code>float</code> - a normalized value that determines how much to grayscale the given texture. a value of 1 will give full grayscale.

**Returns**: <code>vec4</code> - the grayscale value of the given texture
### `_diChromeSynPass()`

Converts an RGB or RGBA color vector into a two tone color.
```glsl
vec3 diChromeRGB = _diChrome(vec3 rgb, vec3 color1, vec3 color2);
vec4 diChromeRGBA = _diChrome(vec4 rgba, vec3 color1, vec3 color2);
```

**Params**

- smp <code>sampler2D</code> - the texture or syn pass to re-color
- color1 <code>vec3</code> - the first rgb color vector to re-color to
- color2 <code>vec3</code> - the second rgb color vector to re-color to

**Returns**: <code>vec4</code> - the dichromed value of the given texture
### `_hBlurTiltShiftSynPass()`

Applies a tilt shift in the horizontal direction. Use in tandem with `_vBlurTiltShiftSynPass()` in a second pass to create a tilt shift effect. Note that this effect can be very expensive!

```glsl
vec4 renderMain(void)
{
    if(PASSINDEX == 0) {
      return _loadUserImage();
    } else if (PASSINDEX == 1){
      return _hBlurTiltShiftSynPass(sampler2D texIn, float blurAmt, float blurLoc);
    } else if (PASSINDEX == 2) {
      return _vBlurTiltShiftSynPass(sampler2D texIn, float blurAmt, float blurLoc);
    } 
}

```

**Params**

- texIn <code>sampler2D</code> - the texture or syn pass to apply the effect to
- blurAmt <code>float</code> - the blur level. This will add iterations to the blur loop, so lower will be faster
- blurLoc <code>float</code> - the location of the blur

**Returns**: <code>vec4</code> - the blurred texture
### `_vBlurTiltShiftSynPass()`

Applies a tilt shift in the vertical direction. Use in tandem with `_vBlurTiltShiftSynPass()` in a second pass to create a tilt shift effect. Note that this effect can be very expensive!

```glsl
vec4 renderMain(void)
{
    if(PASSINDEX == 0) {
      return _loadUserImage();
    } else if (PASSINDEX == 1){
      return syn_pass_horBlurTiltShift(sampler2D texIn, float blurAmt, float blurLoc);
    } else if (PASSINDEX == 2) {
      return syn_pass_vertBlurTiltShift(sampler2D texIn, float blurAmt, float blurLoc);
    } 
}

```

**Params**

- texIn <code>sampler2D</code> - the texture or syn pass to apply the effect to
- blurAmt <code>float</code> - the blur level. This will add iterations to the blur loop, so lower will be faster
- blurLoc <code>float</code> - the location of the blur

**Returns**: <code>vec4</code> - the blurred texture
