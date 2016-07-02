int hello_world(unsigned int *addr, char const *p)
{
    while(*p)
    {
        *addr = *(p++);
    }
    return 0;
}
