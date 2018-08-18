#include <stdio.h>
#define CANTIDAD_DE_ARGUMENTOS 4
#define EXIT_OK 1
#define EXIT_ERROR -1
int main ( int argc, char **argv )
{
    if (argc!=CANTIDAD_DE_ARGUMENTOS)
    {
        printf("Cantidad invalidad de argumentos");
        return EXIT_ERROR;
    }
    return EXIT_OK;

}
