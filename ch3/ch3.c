typedef void (*init_func) (void);

static init_func init[] = {
    arm920t_init_mmu,
    s3c2410_init_clock,
    s3c2410_init_memory,
    s3c2410_init_irq,
    s3c2410_init_io,
    NULL
};

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
