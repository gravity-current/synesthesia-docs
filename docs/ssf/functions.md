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

### `_map()`

Map a value inside of a given range to a new range, scaling the value linearly.
```glsl
float scaledValue = _map(float value, float min, float max, float new_min, float new_max);
vec2 scaledValue = _map(vec2 value, vec2 min, vec2 max, vec2 new_min, vec2 new_max);
vec3 scaledValue = _map(vec3 value, vec3 min, vec3 max, vec3 new_min, vec3 new_max);
vec4 scaledValue = _map(vec4 value, vec4 min, vec4 max, vec4 new_min, vec4 new_max);
```

**Params**

- value <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - a value inside of the min and max range
- min <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the current min value
- max <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the current max value
- new_min <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the new min value
- new_max <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the new max value

**Returns**: <code>float</code> - the current value mapped to the new range

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
```glsl
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

### `_inRange()`
Check if a value or all components of a vector are within a given range. Returns a float so it can easily be used as a mask or mix value.

```glsl
float inRange = _inRange(float value);
float inRange = _inRange(float value, float min, float max);
float inRange = _inRange(vec2 value);
float inRange = _inRange(vec2 value, float min, float max);
float inRange = _inRange(vec3 value);
float inRange = _inRange(vec3 value, float min, float max);
float inRange = _inRange(vec4 value);
float inRange = _inRange(vec4 value, float min, float max);
```

**Params**
- value <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the value to check
- [min] <code>float</code> - the lower bound of the range (defaults to `0` if omitted)
- [max] <code>float</code> - the upper bound of the range (defaults to `1` if omitted)

**Returns**: <code>float</code> - `1.0` if the value is within the range, `0.0` if it is not

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
```glsl
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

- valIn <code>float</code> - the value inside of the `cos()` function

**Returns**: <code>float</code> - the value of the wave at the given position, ranging from `0` to `1`

### `_nclamp()`

Clamps a given value between 0 and 1. Useful with a `mix` function where a value over `1` can cause issues on some GPUs.

```glsl
float clampedVal = _nclamp(float var);
vec2 clampedVal = _nclamp(vec2 var);
vec3 clampedVal = _nclamp(vec3 var);
vec4 clampedVal = _nclamp(vec4 var);
```

**Params**

- valIn <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the value to clamp

**Returns**: <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the clamped value

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
float noise = _fbm(float seed, float octave);
float noise = _fbm(vec2 seed);
float noise = _fbm(vec2 seed, float octave);
float noise = _fbm(vec3 seed);
float noise = _fbm(vec3 seed, float octave);
```

**Params**

- seed <code>float</code> | <code>vec2</code> | <code>vec3</code> - the seed used to generate the noise value
- [octave] <code>float</code> - the number of octaves to calculate. More octaves creates more detailed noise. Default is `5`

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

### `_mirror()`

Mirrors a value or coordinate to allow seamless repetitions or tilings

```glsl
float mirrored = _mirror(float value);
vec2 mirrored = _mirror(vec2 value);
vec3 mirrored = _mirror(vec3 value);
vec4 mirrored = _mirror(vec4 value);
```

**Params**

- value <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the value to be mirrored

**Returns**: <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the mirrored value

**Example**  
```glsl
// sample media with mirrored coordinates so it creates a seamless tile
vec2 mirroredCoords = _mirror(_uv);
vec4 media = textureMedia(mirroredCoords * 10);
```

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

### `_brightness()`

Set the brightness of a color.
```glsl
vec3 adjustedColor = _brightness(vec3 color, float brightness);
vec4 adjustedColor = _brightness(vec4 color, float brightness);
```

**Params**
- color <code>vec3</code> | <code>vec4</code> - the color to adjust
- brightness `float` - the brightness value to set the color to. `0.0` is black, `1.0` is no change, `2.0` is twice as bright, etc.

**Returns**: <code>vec3</code> | <code>vec4</code> - the adjusted color

### `_gamma()`

Apply gamma correction to a color, making the midtones brighter/darker without affecting the shadows or highlights.
```glsl
vec3 adjustedColor = _gamma(vec3 color, float gamma);
vec4 adjustedColor = _gamma(vec4 color, float gamma);
```

**Params**
- color <code>vec3</code> | <code>vec4</code> - the color to adjust
- gamma `float` - the gamma correction value. `0.5` makes the color generally darker, `1.0` is no change, `1.5` makes it brighter

**Returns**: <code>vec3</code> | <code>vec4</code> - the adjusted color

### `_contrast()`

Adjust the contrast of a color. More contrast makes the brights brighter and the darks darker.
```glsl
vec3 adjustedColor = _contrast(vec3 color, float contrast);
vec4 adjustedColor = _contrast(vec4 color, float contrast);
```

**Params**
- color <code>vec3</code> | <code>vec4</code> - the color to adjust
- contrast `float` - the contrast value. `0` is solid gray, `1` is no change, `2` is twice as much contrast, etc.

**Returns**: <code>vec3</code> | <code>vec4</code> - the adjusted color

### `_saturation()`

Adjust the saturation or intensity of a color by scaling it.

```glsl
vec3 adjustedColor = _saturation(vec3 color, float saturation);
vec4 adjustedColor = _saturation(vec4 color, float saturation);
```

**Params**
- color <code>vec3</code> | <code>vec4</code> - the color to adjust
- saturation `float` - the saturation value. `0.5` makes it half as saturated, `1` is no change, `2` is twice as saturated, etc.

**Returns**: <code>vec3</code> | <code>vec4</code> - the adjusted color

### `_hueRotate()`

Rotates a color around the hue wheel

```glsl
vec3 adjustedColor = _hueRotate(vec3 color, float rot);
vec4 adjustedColor = _hueRotate(vec4 color, float rot);
```

**Params**

- color <code>vec3</code> | <code>vec4</code> - a normalized color vector
- rot <code>float</code> - rotation value in degrees

**Returns**: <code>vec3</code> | <code>vec4</code> - the adjusted color

### `_invert()`

Invert a color

```glsl
vec3 invertedColor = _invert(vec3 color, float invert);
vec4 invertedColor = _invert(vec4 color, float invert);
```

**Params**

- color <code>vec3</code> | <code>vec4</code> - color to be inverted
- invert <code>float</code> - amount to invert the color. `0` is no change, `1` is fully inverted

**Returns**: <code>vec3</code> | <code>vec4</code> - the inverted color


### `_luminance()`

Calculate the luminance of a color, which approximates how bright it appears to humans.

```glsl
float luminance = _luminance(vec3 color);
float luminance = _luminance(vec4 color);
```

**Params**
- color <code>vec3</code> | <code>vec4</code> - the color to calculate the luminance of

**Returns**: `float` - the luminance of the color

### `_grayscale()`

Converts an RGB or RGBA color vector into a grayscale vector based on its luminance.
```glsl
vec3 grayscaleColor = _grayscale(vec3 color);
vec4 grayscaleColor = _grayscale(vec4 color);
vec3 grayscaleColor = _grayscale(vec3 color, float intensity);
vec4 grayscaleColor = _grayscale(vec4 color, float intensity);
```

**Params**

- color <code>vec3</code> | <code>vec4</code> - the color to adjust
- [intensity] <code>float</code> - intensity of the effect. `1` is full grayscale, `0` is no change. Defaults to `1` if left out

**Returns**: <code>vec3</code> | <code>vec4</code> - the grayscaled color

### `_dichrome()`
Converts an RGB or RGBA color vector into a two tone color. Dark colors will be mapped to color1, and light colors will be mapped to color2.

```glsl
vec3 dichromeColor = _diChrome(vec3 color, vec3 color1, vec3 color2);
vec4 dichromeColor = _diChrome(vec4 color, vec3 color1, vec3 color2);
```

**Params**

- color <code>vec3</code> | <code>vec4</code> - the color to be affected
- color1 <code>vec3</code> - the color dark colors will be mapped to
- color2 <code>vec3</code> - the color light colors will be mapped to

**Returns**: <code>vec3</code> | <code>vec4</code> - the converted dichrome color

## Media

### `_loadMedia()`

Loads the color of the selected user media at the current pixel, optionally adjusted by an offset.

```glsl
vec4 mediaColor = _loadMedia();
vec4 mediaColor = _loadMedia(float lod);
vec4 mediaColor = _loadMedia(vec2 offset);
vec4 mediaColor = _loadMedia(vec2 offset, float lod);
```

**Params**

- [lod] <code>float</code> - the level of detail to use when sampling the texture. **NOTE:** only works when media filter mode is set to `"mipmap"` (see [media JSON configuration](json.md#media))
- [offset] <code>vec2</code> - the offset from the current pixel to sample the texture

**Returns**: <code>vec4</code> - the color of the user media at the current pixel (adjusted by offset)

### `_textureMedia()`

Samples user media at custom uv coordinates. Includes aspect ratio correction, so the media will not appear stretched. If you want to sample media without any correction, use `texture(syn_Media)`

```glsl
vec4 mediaColor = _textureMedia(vec2 uv);
vec4 mediaColor = _textureMedia(vec2 uv, float lod);
```

**Params**

- uv <code>vec2</code> - the uv coordinates at which to sample the user media (should be in the range 0-1)
- [lod] <code>float</code> - the level of detail to use when sampling the texture. **NOTE:** only works when media filter mode is set to `"mipmap"` (see [media JSON configuration](json.md#media))

**Returns**: <code>vec4</code> - the color of the user media at the given uv coordinates

### `_loadMediaAsMask()`

Loads the selected user media at the current pixel as a mask, with values thresholded to be either `0.0` or `1.0`.
By multiplying a color vector by one of the output channels (`r`, `g`, and `b` are the same), you can mask the color
to only appear when the user image is prominent.
```glsl
vec4 mediaMask = _loadMediaAsMask();
vec4 mediaMask = _loadMediaAsMask(vec2 offset);
```

**Params**

- [lod] <code>float</code> - the level of detail to use when sampling the texture. **NOTE:** only works when media filter mode is set to `"mipmap"` (see [media JSON configuration](json.md#media))
- [offset] <code>vec2</code> - the offset from the current pixel to sample the texture

**Returns**: <code>vec4</code> - the thresholded color of the user media at the current pixel (adjusted by offset). Either `vec4(0.0)` or `vec4(1.0)`  

### `_textureMediaAsMask()`

Samples user media at the given coordinates as a mask, with values thresholded to be either `0.0` or `1.0`. By multiplying a color vector by one of the output channels (`r`, `g`, and `b` are the same), you can mask the color to only appear when the user image is prominent.

```glsl
vec4 mediaMask = _textureMediaAsMask(vec2 uv);
```

**Params**

- uv <code>vec2</code> - the uv coordinates at which to sample the user media (should be in the range 0-1)

**Returns**: <code>vec4</code> - the thresholded color of the user media at the given coordinates. Either `vec4(0.0)` or `vec4(1.0)`

### `_correctMediaCoords()`

Correct the aspect ratio of uv coordinates so they can be used to sample user media without appearing stretched. It scales the coordinates based on the aspect ratio of `sampler2D syn_Media`, which stores user media.

```glsl
vec2 aspectCorrectedCoords = _correctMediaCoords();
vec2 aspectCorrectedCoords = _correctMediaCoords(vec2 uv);
```

**Params**

- [uv] <code>vec2</code> - the uv coordinates to correct. Will default to _uv if omitted

**Returns**: <code>vec2</code> - the uv coordinates corrected for aspect ratio

### `_isMediaActive()`

Returns whether a user has selected media in the media panel.

```glsl
bool isMediaActive = _isMediaActive();
```

**Returns**: <code>bool</code> - `true` if media is selected and `false` if "none" is selected

### `_edgeDetectMedia()`

Detects edges of the selected user media inexpensively through a bilinear method.

```glsl
vec4 mediaEdges = _edgeDetectMedia();
```

**Returns**: <code>vec4</code> - the color of the edges for the selected user media. This value is likely to be small

### `_edgeDetectSobelMedia()`

Detects edges of the currently selected user media using the sobel method. More info oon the sobel operator [can be found here.](https://en.wikipedia.org/wiki/Sobel_operator).

```glsl
vec4 mediaEdges = _edgeDetectSobelMedia();
```

**Returns**: <code>vec4</code> - the edges of the currently selected media

## Multipass

### `_edgeDetect()`

Detects edges of a given texture or syn pass inexpensively through a bilinear method.

```glsl
vec4 passEdges = _edgeDetect(sampler2D texture);
vec4 passEdges = _edgeDetect(sampler2D texture, vec2 uv);
```

**Params**

- texture <code>sampler2D</code> - the texture or syn pass to calculate the edges for
- [uv] <code>vec2</code> - the coordinates to sample the texture at. Defaults to `_uv`

**Returns**: <code>vec4</code> - the color of the edges for the given texture. This value is likely to be small

### `_edgeDetectSobel()`

Detects edges of a given texture or syn pass through the sobel method. This is more expensive than `_edgeDetect` but produces better edges. More info on the sobel operator can be found [here](https://en.wikipedia.org/wiki/Sobel_operator).

```glsl
vec4 passEdges = _edgeDetectSobel(sampler2D texture);
vec4 passEdges = _edgeDetectSobel(sampler2D texture, vec2 uv);
```

**Params**

- texture <code>sampler2D</code> - the texture or syn pass to calculate the edges for
- [uv] <code>vec2</code> - the coordinates to sample the texture at. Defaults to `_uv`

**Returns**: <code>vec4</code> - the color of the edges for the given texture

### `_hBlurTiltShift()`

Applies a tilt shift in the horizontal direction. Use in tandem with `_vBlurTiltShift()` in a second pass to create a tilt shift effect. Note that this effect can be very expensive!

```glsl
vec4 blurred = _hBlurTiltShift(sampler2D texture);
vec4 blurred = _hBlurTiltShift(sampler2D texture, vec2 uv);
vec4 blurred = _hBlurTiltShift(sampler2D texture, vec2 uv, float blurAmt);
vec4 blurred = _hBlurTiltShift(sampler2D texture, vec2 uv, float blurAmt, float blurLoc);
```

**Params**

- texIn <code>sampler2D</code> - the texture or pass to apply the effect to
- [uv] <code>vec2</code> - the coordinates to sample the texture at. Defaults to `_uv`
- [blurAmt] <code>float</code> - the blur level. This will add iterations to the blur loop, so lower will be faster. Default is 5.0
- [blurLoc] <code>float</code> - the location of the blur. Default is 0.5

**Returns**: <code>vec4</code> - the blurred texture

**Example**:

```glsl
vec4 renderMain(void)
{
	if (PASSINDEX == 0) {
		return _loadMedia();
	} else if (PASSINDEX == 1){
		return _hBlurTiltShift(mediaPass, 5.0, 0.5);
	} else if (PASSINDEX == 2) {
		return _vBlurTiltShift(hPass, 5.0, 0.5);
	} 
}
```

### `_vBlurTiltShift()`

Applies a tilt shift in the vertical direction. Use in tandem with `_vBlurTiltShift()` in a second pass to create a tilt shift effect. Note that this effect can be very expensive!

```glsl
vec4 blurred = _vBlurTiltShift(sampler2D texture);
vec4 blurred = _vBlurTiltShift(sampler2D texture, vec2 uv);
vec4 blurred = _vBlurTiltShift(sampler2D texture, vec2 uv, float blurAmt);
vec4 blurred = _vBlurTiltShift(sampler2D texture, vec2 uv, float blurAmt, float blurLoc);
```

**Params**

- texIn <code>sampler2D</code> - the texture or pass to apply the effect to
- [uv] <code>vec2</code> - the coordinates to sample the texture at. Defaults to `_uv`
- [blurAmt] <code>float</code> - the blur level. This will add iterations to the blur loop, so lower will be faster. Default is 5.0
- [blurLoc] <code>float</code> - the location of the blur. Default is 0.5

**Returns**: <code>vec4</code> - the blurred texture
