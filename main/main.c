#include <mymath.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    struct Vector2D A;
    A.x = 1, A.y = 2;
    struct Vector2D B;
    B.x = 3, B.y = 4;

    printf("Point A=");
    vector2d_print(&A);
    printf("\n");

    printf("POint B=");
    vector2d_print(&B);
    printf("\n");

    printf("A*B=%lf, |A|=%lf, |B|=%lf\n", vector2d_mul(&A, &B), vector2d_norm(&A), vector2d_norm(&B));

    return 0;
}