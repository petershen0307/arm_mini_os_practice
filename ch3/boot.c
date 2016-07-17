typedef void (*init_func) (void);
#define UFCON0 ((volatile unsigned int *)(0x50000020))

void hello_world(void)
{
    char const *p = "hello world\n";
    while (*p)
    {
        *UFCON0 = *(p++);
    }
}

static init_func init[] = {
    hello_world,
    0
};

void boot_start()
{
    while (1);
}

void load_init_boot(init_func *init)
{
    int i;
    for (i = 0; init[i]; ++i)
    {
        init[i]();
    }
    boot_start();
}

void plat_boot(void)
{
    load_init_boot(init);
}
