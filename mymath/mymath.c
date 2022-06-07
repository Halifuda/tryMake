#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "mymath.h"


double vector2d_mul(const struct Vector2D *A, const struct Vector2D *B)
{
    return A->x * B->x + A->y * B->y;
}

double vector2d_norm(const struct Vector2D *V)
{
    return sqrt(V->x * V->x + V->y * V->y);
}

void vector2d_print(const struct Vector2D *V)
{
    printf("(%lf, %lf)", V->x, V->y);
}