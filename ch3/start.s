;3-3
.section .startup
.code 32
.align 0
.global _start
.extern __vector_reset
.extern __vector_undefined
.extern __vector_swi
.extern __vector_prefetch_abort
.extern __vector_data_abort
.extern __vector_reserved
.extern __vector_irq
.extern __vector_fiq

_start:
ldr pc, _vector_reset ;first execute, error handles are below
ldr pc, _vector_undefined
ldr pc, _vector_swi
ldr pc, _vector_prefetch_abort
ldr pc, _vector_data_abort
ldr pc, _vector_reserved
ldr pc, _vector_irq
ldr pc, _vector_fiq

.align 4

_vector_reset:          .word __vector_reset
_vector_undefined:      .word __vector_undefined
_vector_swi:            .word __vector_swi
_vector_prefetch_abort: .word __vector_prefetch_abort
_vector_data_abort:     .word __vector_data_abort
_vector_reserved:       .word __vector_reserved
_vector_irq:            .word __vector_irq
_vector_fiq:            .word __vector_fiq
;3-4
.text
.code 32
.global __vector_reset

.extern plat_boot
.extern __bss_start__
.extern __bss_end__

__vector_reset:
    msr cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | SVC_MOD)
    LDR SP, =_SVC_STACK

    msr cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | IRQ_MOD)
    LDR SP, =_IRQ_STACK

    msr cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | FIQ_MOD)
    LDR SP, =_FIQ_STACK

    msr cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | ABT_MOD)
    LDR SP, =_ABT_STACK

    msr cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | UND_MOD)
    LDR SP, =_UND_STACK

    msr cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | SYS_MOD)
    LDR SP, =_SYS_STACK

_clear_bss:
    ldr r1, _bss_start_
    ldr r3, _bss_end_
    mov r2, #0x0

l:
    cmp r1, r3
    beq _main
    str r2, [r1], #0x4

_main:
    b plat_boot

_bss_start_: .word __bss_start__
_bss_end_: .word __bss_end__

.end
