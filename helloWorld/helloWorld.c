#define UFCON0 ((volatile unsigned int *)(0x50000020))

void hello_world()
{
    const char *p = "hello world\n";
    while(*p)
    {
        *UFCON0 = *(p++);
    }
    while(1);
}
