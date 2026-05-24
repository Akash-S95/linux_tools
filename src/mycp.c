#include <stdio.h>
#include "utils.h"

int main(int argc, char *argv[])
{
    FILE *source;
    FILE *destination;

    char ch;

    if(argc != 3)
    {
        print_error();
        return 1;
    }

    source = fopen(argv[1], "r");

    if(source == NULL)
    {
        printf("Source File Not Found\n");
        return 1;
    }

    destination = fopen(argv[2], "w");

    if(destination == NULL)
    {
        printf("Cannot Create Destination File\n");

        fclose(source);

        return 1;
    }

    while((ch = fgetc(source)) != EOF)
    {
        fputc(ch, destination);
    }

    fclose(source);
    fclose(destination);

    printf("File Copied Successfully\n");

    return 0;
}
