#include <stdio.h>
#include "utils.h"

int main(int argc, char *argv[])
{
    FILE *fp;

    char ch;

    if(argc != 2)
    {
        print_error();
        return 1;
    }

    fp = fopen(argv[1], "r");

    if(fp == NULL)
    {
        printf("File Not Found\n");
        return 1;
    }

    while((ch = fgetc(fp)) != EOF)
    {
        printf("%c", ch);
    }

    fclose(fp);

    return 0;
}
