#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int x;
    int y;
    int colour;
} Point;

int main()
{
    Point* new_point = malloc(sizeof(Point));
    new_point->x = 1;
    new_point->y = 2;
    new_point->colour = 0xffc0cb;

    printf("Point at %p\n", new_point);
    printf("%d %d %d\n", new_point->x, new_point->y, new_point->colour);
    return 0;
}
