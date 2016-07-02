#define UFCON0 ((volatile unsigned int *)(0x50000020))

int hello_world(unsigned int *addr, char const *p)
{
    while(*p)
    {
        *addr = *(p++);
    }
    return 0;
}
