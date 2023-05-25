# hg_sdf Functions

In addition to the built in SSF functions, we have included the open-source [hg_sdf library by mercury](https://mercury.sexy/hg_sdf/) for your convienence. This library provides a very large toolset for creating raymarched scenes. To avoid namespace collision, we have prefixed all available functions with `_`. The following documentation is provided from the Mercury team. For more information, check out [their website](https://mercury.sexy/hg_sdf/).

## Helper Functions and Macros

### `_sgn()`

Sign function that doesn't return 0
```glsl
float signedValue = _sgn(float x);
vec2 signedValue = _sgn(vec2 v);
```

**Params**

- x <code>float</code> | <code>vec2</code> - the value to be signed

**Returns**: <code>float</code> - `1` or `-1` 

### `_square()`

square the value
```glsl
float squared = _square(float x);
vec2 squared = _square(vec2 x);
vec3 squared = _square(vec3 x);
vec4 squared = _square(vec4 x);
```

**Params**

- x <code>float</code> | <code>vec2</code> | <code>vec3</code> | <code>vec4</code>- the value to be squared

**Returns**: <code>float</code> - squared value

### `_lengthSqr()`

```glsl
float squared = _lengthSqr(vec2 x);
float squared = _lengthSqr(vec3 x);
```

**Params**

- x <code>vec2</code> | <code>vec3</code> - a vector to find the square of its length

**Returns**: <code>float</code> - squared length value

### `_vmax()`

Maximum components of a vector
```glsl
float vectorMax = _vmax(vec2 v);
float vectorMax = _vmax(vec3 v);
float vectorMax = _vmax(vec4 v);
```

**Params**

- v <code>vec2</code> | <code>vec3</code> | <code>vec4</code> - the vector to be evaluated

**Returns**: <code>float</code> - the largest component of the vector

### `_vmin()`

Minimum components of a vector
```glsl
float vectorMin = _vmin(vec2 v);
float vectorMin = _vmin(vec3 v);
float vectorMin = _vmin(vec4 v);
```

**Params**

- v <code>vec2</code> | <code>vec3</code> | <code>vec4</code>- the vector to be evaluated

**Returns**: <code>float</code> - the smallest component of the vector

## Primitive Objects

Conventions:
Everything that is a distance function is called fSomething.
The first argument is always a point in 2 or 3-space called `p`.
Unless otherwise noted, (if the object has an intrinsic "up"
side or direction) the y axis is "up" and the object is
centered at the origin.

### `_fSphere()`

```glsl
float sphere = _fSphere(vec3 p, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code> - the radius of the sphere

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fPlane()`

Plane with normal n (n is normalized) at some distance from the origin
```glsl
float plane = _fPlane(vec3 p, vec3 n, float distanceFromOrigin);
```

**Params**

- p <code>vec3</code> - a point in space
- n <code>vec3</code> - the plane normal
- distanceFromOrigin <code>float</code> - the distance from the center

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fBoxCheap()`

Cheap Box: distance to corners is overestimated
```glsl
float cheapBox = _fBoxCheap(vec3 p, vec3 b);
```

**Params**

- p <code>vec3</code> - a point in space
- b <code>vec3</code> - the box dimensions

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fBox()`

Box: correct distance to corners
```glsl
float box = _fBox(vec3 p, vec3 b);
```

**Params**

- p <code>vec3</code> - a point in space
- b <code>vec3</code> - the box dimensions

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fBox2Cheap()`

Same as above, but in two dimensions (an endless box)
```glsl
float box = _fBox2Cheap(vec2 p, vec2 b);
```

**Params**

- p <code>vec2</code> - a point in space
- b <code>vec2</code> - the box dimensions

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fBox2()`

```glsl
float box = _fBox2(vec2 p, vec2 b);
```

**Params**

- p <code>vec2</code> - a point in space
- b <code>vec2</code> - the box dimensions

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fCorner()`

Endless "corner"
```glsl
float corner = _fCorner(vec2 p);
```

**Params**

- p <code>vec2</code> - a point in space

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fBlob()`

Blobby ball object. You've probably seen it somewhere. This is not a correct distance bound, beware.
```glsl
float blob = _fBlob(vec3 p);
```

**Params**

- p <code>vec3</code> - a point in space

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fCylinder()`

Cylinder standing upright on the xz plane
```glsl
float cylinder = _fCylinder(vec3 p, float r, float height);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code> - the radius of the cylinder
- height <code>float</code> - the height of the cylinder along the y axis

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fCapsule()`

Capsule: A Cylinder with round caps on both sides
```glsl
float capsule = _fCapsule(vec3 p, float r, float c);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code> - the radius of the capsule
- c <code>float</code> - the height of the capsule along the y axis

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fLineSegment()`

Distance to line segment between `a` and `b`, used for fCapsule() version 2 below
```glsl
float dist = _fLineSegment(vec3 p, vec3 a, vec3 b);
```

**Params**

- p <code>vec3</code> - a point in space
- a <code>vec3</code> - line segment A
- b <code>vec3</code> - linge segment B

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fCapsule()`

Capsule version 2: between two end points <a> and <b> with radius r
```glsl
float capsule = _fCapsule(vec3 p, vec3 a, vec3 b, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- a <code>vec3</code> - line segment A
- b <code>vec3</code> - linge segment B
- r <code>float</code> - the radius of the capsule

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fCapsule()`

Capsule version 2: between two end points <a> and <b> with radius r
```glsl
float capsule = _fCapsule(vec3 p, vec3 a, vec3 b, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- a <code>vec3</code> - line segment A
- b <code>vec3</code> - linge segment B
- r <code>float</code> - the radius of the capsule

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fTorus()`

Torus in the XZ-plane
```glsl
float donut = _fTorus(vec3 p, float smallRadius, float largeRadius);
```

**Params**

- p <code>vec3</code> - a point in space
- smallRadius <code>float</code> - the 'inside' radius
- largeRadius <code>float</code> - the 'outside' radius

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fCircle()`

A circle line. Can also be used to make a torus by subtracting the smaller radius of the torus.
```glsl
float circle = _fCircle(vec3 p, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code> - the radius

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fCircle()`

A circle line. Can also be used to make a torus by subtracting the smaller radius of the torus.
```glsl
float circle = _fCircle(vec3 p, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code> - the radius

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fDisc()`

A circular disc with no thickness (i.e. a cylinder with no height). Subtract some value to make a flat disc with rounded edge.
```glsl
float disc = _fDisc(vec3 p, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code> - the radius

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fHexagonCircumcircle()`

Hexagonal prism, circumcircle variant
```glsl
float prism = _fHexagonCircumcircle(vec3 p, vec2 h);
```

**Params**

- p <code>vec3</code> - a point in space
- h <code>vec2</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fHexagonIncircle()`

Hexagonal prism, circumcircle variant
```glsl
float prism = _fHexagonIncircle(vec3 p, vec2 h);
```

**Params**

- p <code>vec3</code> - a point in space
- h <code>vec2</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fCone()`

Cone with correct distances to tip and base circle. Y is up, 0 is in the middle of the base.
```glsl
float cone = _fCone(vec3 p, float radius, float height);
```

**Params**

- p <code>vec3</code> - a point in space
- radius <code>float</code> - the radius of the cone at the base
- height <code>float</code> - the height of the cone

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fOctahedron()`

```glsl
float polyhedron = _fOctahedron(vec3 p, float r, float e);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code>
- e <code>float</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fDodecahedron()`

```glsl
float polyhedron = _fDodecahedron(vec3 p, float r, float e);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code>
- e <code>float</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fIcosahedron()`

```glsl
float polyhedron = _fIcosahedron(vec3 p, float r, float e);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code>
- e <code>float</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fTruncatedOctahedron()`

```glsl
float polyhedron = _fTruncatedOctahedron(vec3 p, float r, float e);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code>
- e <code>float</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fTruncatedIcosahedron()`

```glsl
float polyhedron = _fTruncatedIcosahedron(vec3 p, float r, float e);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code>
- e <code>float</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fOctahedron()`

```glsl
float polyhedron = _fOctahedron(vec3 p, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fDodecahedron()`

```glsl
float polyhedron = _fDodecahedron(vec3 p, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fIcosahedron()`

```glsl
float polyhedron = _fIcosahedron(vec3 p, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fTruncatedOctahedron()`

```glsl
float polyhedron = _fIcosahedron(vec3 p, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code>

**Returns**: <code>float</code> - the distance from the object at the given point

### `_fTruncatedIcosahedron()`

```glsl
float polyhedron = _fTruncatedIcosahedron(vec3 p, float r);
```

**Params**

- p <code>vec3</code> - a point in space
- r <code>float</code>

**Returns**: <code>float</code> - the distance from the object at the given point

## Domain Manipulation Operators

Conventions:
Everything that modifies the domain is named pSomething.
Many operate only on a subset of the three dimensions. For those,
you must choose the dimensions that you want manipulated
by supplying e.g. `p.x` or `p.zx`
`inout p` is always the first argument and modified in place.
Many of the operators partition space into cells. An identifier
or cell index is returned, if possible. This return value is
intended to be optionally used e.g. as a random seed to change
parameters of the distance functions inside the cells.
Unless stated otherwise, for cell index 0, <p> is unchanged and cells
are centered on the origin so objects don't have to be moved to fit.

### `_pR()`
Rotate around a coordinate axis (i.e. in a plane perpendicular to that axis) by angle `a`. Read like this: `R(p.xz, a)` rotates "x towards z".
This is fast if `a` is a compile-time constant and slower (but still practical) if not.

**Directly modifies the input vector as an `inout` parameter**
```glsl
_pR(inout vec2 p, float a);
```

**Params**

- p <code>vec2</code> - a point in space
- r <code>float</code> - the rotation amount

### `_pR45()`
Shortcut for 45-degrees rotation

**Directly modifies the input vector as an `inout` parameter**
```glsl
_pR45(inout vec2 p);
```

**Params**

- p <code>vec2</code> - a point in space

### `_pMod1()`
Repeat space along one axis. .

**Directly modifies the input vector as an `inout` parameter**
```glsl
//Use like this to repeat along the x axis:
float cell = _pMod1(inout float p, float size); // using the return value is optional
```

**Params**

- p <code>float</code> - the axis to repeat along
- size <code>float</code> - the size of the "cells" or repeated spaces

**Returns**: <code>float</code> - the current cell

### `_pModMirror1()`
Same, but mirror every second cell so they match at the boundaries

**Directly modifies the input vector as an `inout` parameter**
```glsl
float cell = _pModMirror1(inout float p, float size); 
```

**Params**

- p <code>float</code> - the axis to repeat along
- size <code>float</code> - the size of the "cells" or repeated spaces

**Returns**: <code>float</code> - the current cell

### `_pModSingle1()`
Repeat the domain only in positive direction. Everything in the negative half-space is unchanged.

**Directly modifies the input vector as an `inout` parameter**
```glsl
float cell = _pModSingle1(inout float p, float size); 
```

**Params**

- p <code>float</code> - the axis to repeat along
- size <code>float</code> - the size of the "cells" or repeated spaces

**Returns**: <code>float</code> - the current cell

### `_pModInterval1()`
Repeat only a few times: from indices `start` to `stop` (similar to above, but more flexible)

**Directly modifies the input vector as an `inout` parameter**
```glsl
float cell = _pModInterval1(inout float p, float size, float start, float stop); 
```

**Params**

- p <code>float</code> - the axis to repeat along
- size <code>float</code> - the size of the "cells" or repeated spaces
- start <code>float</code> - which cell to start the repeat
- stop <code>float</code> - which cell to stop the repeat

**Returns**: <code>float</code> - the current cell

### `_pModPolar()`
Repeat around the origin by a fixed angle. For easier use, num of repetitions is used to specify the angle.

**Directly modifies the input vector as an `inout` parameter**
```glsl
float cell = _pModPolar(inout vec2 p, float repetitions); 
```

**Params**

- p <code>vec2</code> - the axis to repeat along
- repetitions <code>float</code> - the angle to repeat

**Returns**: <code>float</code> - the current cell

### `_pMod2()`
Repeat in two dimensions

**Directly modifies the input vector as an `inout` parameter**
```glsl
float cell = _pMod2(inout vec2 p, vec2 size); 
```

**Params**

- p <code>vec2</code> - the axis to repeat along
- size <code>float</code> - the size of the "cells" or repeated spaces

**Returns**: <code>float</code> - the current cell

### `_pModMirror2()`
Same, but mirror every second cell so all boundaries match

**Directly modifies the input vector as an `inout` parameter**
```glsl
float cell = _pModMirror2(inout vec2 p, vec2 size); 
```

**Params**

- p <code>vec2</code> - the axis to repeat along
- size <code>float</code> - the size of the "cells" or repeated spaces

**Returns**: <code>float</code> - the current cell

### `_pModGrid2()`
Same, but mirror every second cell at the diagonal as well

**Directly modifies the input vector as an `inout` parameter**
```glsl
float cell = _pModMirror2(inout vec2 p, vec2 size); 
```

**Params**

- p <code>vec2</code> - the axis to repeat along
- size <code>float</code> - the size of the "cells" or repeated spaces

**Returns**: <code>float</code> - the current cell

### `_pMod3()`
Repeat in three dimensions

**Directly modifies the input vector as an `inout` parameter**
```glsl
float cell = _pMod3(inout vec2 p, vec3 size); 
```

**Params**

- p <code>vec3</code> - the axis to repeat along
- size <code>float</code> - the size of the "cells" or repeated spaces

**Returns**: <code>float</code> - the current cell

### `_pMirror()`
Mirror at an axis-aligned plane which is at a specified distance `dist` from the origin.

**Directly modifies the input vector as an `inout` parameter**
```glsl
float mirror = _pMirror(inout vec2 p, float dist); 
```

**Params**

- p <code>vec2</code> - the axis to repeat along
- dist <code>float</code> - the distance for the mirror

**Returns**: <code>float</code> - the sign of the mirror

### `_pMirrorOctant()`
Mirror in both dimensions and at the diagonal, yielding one eighth of the space.translate by dist before mirroring.

**Directly modifies the input vector as an `inout` parameter**
```glsl
float cell = _pMirrorOctant(inout vec2 p, float dist); 
```

**Params**

- p <code>vec2</code> - the axis to repeat along
- dist <code>float</code> - the distance for the mirror

**Returns**: <code>float</code> - the sign of the mirror

### `_pReflect()`
Reflect space at a plane

**Directly modifies the input vector as an `inout` parameter**
```glsl
float reflection = _pReflect(inout vec3 p, vec3 planeNormal, float offset); 
```

**Params**

- p <code>vec3</code> - the axis to repeat along
- planeNormal <code>vec3</code> - the normal for the reflection axis
- offset <code>float</code> - offset from the plane

**Returns**: <code>float</code> - the sign of the mirror


## Object Combination Operators
We usually need the following boolean operators to combine two objects:
Union: OR(a,b)
Intersection: AND(a,b)
Difference: AND(a,!b)
(a and b being the distances to the objects).

The trivial implementations are min(a,b) for union, max(a,b) for intersection
and max(a,-b) for difference. To combine objects in more interesting ways to
produce rounded edges, chamfers, stairs, etc. instead of plain sharp edges we
can use combination operators. It is common to use some kind of "smooth minimum"
instead of min(), but we don't like that because it does not preserve Lipschitz
continuity in many cases.

Naming convention: since they return a distance, they are called fOpSomething.
The different flavours usually implement all the boolean operators above
and are called fOpUnionRound, fOpIntersectionRound, etc.

The basic idea: Assume the object surfaces intersect at a right angle. The two
distances `a` and `b` constitute a new local two-dimensional coordinate system
with the actual intersection as the origin. In this coordinate system, we can
evaluate any 2D distance function we want in order to shape the edge.

The operators below are just those that we found useful or interesting and should
be seen as examples. There are infinitely more possible operators.

They are designed to actually produce correct distances or distance bounds, unlike
popular "smooth minimum" operators, on the condition that the gradients of the two
SDFs are at right angles. When they are off by more than 30 degrees or so, the
Lipschitz condition will no longer hold (i.e. you might get artifacts). The worst
case is parallel surfaces that are close to each other.

Most have a float argument `r` to specify the radius of the feature they represent.
This should be much smaller than the object size.

Some of them have checks like "if ((-a < r) && (-b < r))" that restrict
their influence (and computation cost) to a certain area. You might
want to lift that restriction or enforce it. We have left it as comments
in some cases.

usage example:

```glsl
float fTwoBoxes(vec3 p) {
   float box0 = fBox(p, vec3(1));
   float box1 = fBox(p-vec3(1), vec3(1));
   return fOpUnionChamfer(box0, box1, 0.2);
}
```

### `_fOpUnionChamfer()`
The "Chamfer" flavour makes a 45-degree chamfered edge (the diagonal of a square of size `r`)

```glsl
float mergedGeom = _fOpUnionChamfer(float a, float b, float r); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpIntersectionChamfer()`
Intersection has to deal with what is normally the inside of the resulting object when using union, which we normally don't care about too much. Thus, intersection implementations sometimes differ from union implementations.

```glsl
float mergedGeom = _fOpIntersectionChamfer(float a, float b, float r); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpDifferenceChamfer()`
Difference can be built from Intersection or Union

```glsl
float mergedGeom = _fOpDifferenceChamfer(float a, float b, float r); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpUnionRound()`
The "Round" variant uses a quarter-circle to join the two objects smoothly:

```glsl
float mergedGeom = _fOpUnionRound(float a, float b, float r); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpIntersectionRound()`

```glsl
float mergedGeom = _fOpIntersectionRound(float a, float b, float r); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpDifferenceRound()`

```glsl
float mergedGeom = _fOpDifferenceRound(float a, float b, float r); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpUnionColumns()`
The "Columns" flavour makes n-1 circular columns at a 45 degree angle

```glsl
float mergedGeom = _fOpDifferenceRound(float a, float b, float r, float n); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection
- n <code>float</code> - the number of columns to draw

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpDifferenceColumns()`

```glsl
float mergedGeom = _fOpDifferenceColumns(float a, float b, float r, float n); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection
- n <code>float</code> - the number of columns to draw

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpIntersectionColumns()`

```glsl
float mergedGeom = _fOpIntersectionColumns(float a, float b, float r, float n); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection
- n <code>float</code> - the number of columns to draw

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpUnionStairs()`
The "Stairs" flavour produces n-1 steps of a staircase

```glsl
float mergedGeom = _fOpUnionStairs(float a, float b, float r, float n); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection
- n <code>float</code> - the number of stairs to draw

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpIntersectionStairs()`

```glsl
float mergedGeom = _fOpIntersectionStairs(float a, float b, float r, float n); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection
- n <code>float</code> - the number of stairs to draw

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpDifferenceStairs()`

```glsl
float mergedGeom = _fOpDifferenceStairs(float a, float b, float r, float n); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection
- n <code>float</code> - the number of stairs to draw

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpUnionSoft()`
Similar to fOpUnionRound, but more lipschitz-y at acute angles (and less so at 90 degrees). Useful when fudging around too much

```glsl
float mergedGeom = _fOpUnionSoft(float a, float b, float r); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpPipe()`
Produces a cylindical pipe that runs along the intersection. No objects remain, only the pipe. This is not a boolean operator.

```glsl
float mergedGeom = _fOpPipe(float a, float b, float r); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection

**Returns**: <code>float</code> - the distanced to the object

### `_fOpEngrave()`
First object gets a v-shaped engraving where it intersect the second

```glsl
float mergedGeom = _fOpEngrave(float a, float b, float r); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- r <code>float</code> - the radius of the intersection

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpGroove()`
First object gets a capenter-style groove cut out

```glsl
float mergedGeom = _fOpGroove(float a, float b, float ra, float rb); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- ra <code>float</code> - the first radius
- rb <code>float</code> - the second radius

**Returns**: <code>float</code> - the distance of the merged geometry

### `_fOpTongue()`
First object gets a capenter-style tongue attached

```glsl
float mergedGeom = _fOpTongue(float a, float b, float ra, float rb); 
```

**Params**

- a <code>float</code> - the distance from the first geometry you want to unionize
- b <code>float</code> - the distance from the second geometry you want to unionize
- ra <code>float</code> - the first radius
- rb <code>float</code> - the second radius

**Returns**: <code>float</code> - the distance of the merged geometry