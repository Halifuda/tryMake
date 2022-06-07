/*!
    A math library.
*/

#ifndef MYMATH_H_
#define MYMATH_H_

struct Vector2D {
    double x;
    double y;
};

double vector2d_mul(const struct Vector2D *, const struct Vector2D *);
double vector2d_norm(const struct Vector2D *);
void vector2d_print(const struct Vector2D *);

#endif /**< mymath.h */