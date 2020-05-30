/**
 * @file  startup.s
 * @brief Processor vector table and interrupts handlers (including reset)
 *
 * @author Saint-Genest Gwenael <gwen@agilack.fr>
 * @copyright Agilack (c) 2020
 *
 * @page License
 * This firmware is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 3 as published
 * by the Free Software Foundation. You should have received a copy of the
 * GNU General Public License along with this program, see LICENSE.md file
 * for more details.
 * This program is distributed WITHOUT ANY WARRANTY.
 */
    .syntax unified
    .arch armv6-m

/* -- Stack and Head sections ---------------------------------------------- */
    .section .stack
    .align 3
    .equ    Stack_Size, 0x2000
    .globl    __StackTop
    .globl    __StackLimit
__StackLimit:
    .space    Stack_Size
    .size __StackLimit, . - __StackLimit
__StackTop:
    .size __StackTop, . - __StackTop

/* -- Vector Table --------------------------------------------------------- */

    .section .isr_vector
    .align 2
    .globl __isr_vector
__isr_vector:
    /* Cortex M0 Handlers */
    .long   __StackTop                  /* Top of Stack                     */
    .long   Reset_Handler               /* Reset Handler                    */
    .long   NMI_Handler                 /* NMI Handler                      */
    .long   HardFault_Handler           /* Hard Fault Handler               */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   SVC_Handler                 /* SVCall Handler                   */
    .long   0                           /* Debug Monitor Handler            */
    .long   0                           /* Reserved                         */
    .long   PendSV_Handler              /* PendSV Handler                   */
    .long   time_irq                    /* SysTick Handler                  */
    /* SAMC21 Peripherals Handlers */
    .long   PM_Handler                  /* Power Manager Handler            */
    .long   WDT_Handler                 /* Watchdog Timer Handler           */
    .long   RTC_Handler                 /* Real-Time Counter Handler        */
    .long   EIC_Handler                 /* External Interrupt Controller    */
    .long   FREQM_Handler               /* Frequency Meter                  */
    .long   TSENS_Handler               /* Temperature Sensor               */
    .long   NVMCTRL_Handler             /* Non-Volatile Memory Controller   */
    .long   DMAC_Handler                /* Direct Memory Access Controller  */
    .long   EVSYS_Handler               /* Event System Interface           */
    .long   SERCOM0_Handler             /* Serial Communication Interface 0 */
    .long   SERCOM1_Handler             /* Serial Communication Interface 1 */
    .long   SERCOM2_Handler	        /* Serial Communication Interface 2 */
    .long   SERCOM3_Handler             /* Serial Communication Interface 3 */ 
    .long   SERCOM4_Handler             /* Serial Communication Interface 4 */
    .long   SERCOM5_Handler             /* Serial Communication Interface 5 */
    .long   CAN0_Handler                /* Controller Area Network 0        */
    .long   CAN1_Handler                /* Controller Area Network 1        */
    .long   TCC0_Handler                /* Timer Counter Control 0          */
    .long   TCC1_Handler                /* Timer Counter Control 1          */
    .long   TCC2_Handler                /* Timer Counter Control 2          */
    .long   TC0_Handler                 /* Basic Timer Counter 0            */
    .long   TC1_Handler                 /* Basic Timer Counter 1            */
    .long   TC2_Handler                 /* Basic Timer Counter 2            */
    .long   TC3_Handler                 /* Basic Timer Counter 3            */
    .long   TC4_Handler                 /* Basic Timer Counter 4            */
    .long   ADC0_Handler                /* Analog Digital Converter 0       */
    .long   ADC1_Handler                /* Analog Digital Converter 1       */
    .long   AC_Handler                  /* Analog Comparator                */
    .long   DAC_Handler                 /* Digital Analog Converter         */
    .long   SDADC_Handler               /* Sigma-Delta Analog-to-Digital    */
    .long   PTC_Handler                 /* Peripheral Touch Controller      */
    .long   0                           /* Reserved                         */
    .size    __isr_vector, . - __isr_vector

/**
 * @brief Reset handler
 *
 * This function is called when MCU resets (power-up, software reset,
 * watchdog ...) The first step is to clear memory and load some data
 * from flash to sram. Then, call "main" that should never returns.
 */
    .text
    .thumb
    .thumb_func
    .align 2
    .globl Reset_Handler
    .type  Reset_Handler, %function
Reset_Handler:
    /* Copy datas from flash to SRAM */
    ldr    r1, =_etext
    ldr    r2, =__data_start__
    ldr    r3, =__data_end__
    subs    r3, r2
    ble    .copy_end
.copy_loop:
    subs    r3, #4
    ldr    r0, [r1, r3]
    str    r0, [r2, r3]
    bgt    .copy_loop
.copy_end:
    /* Call C code entry ("main" function) */
    bl  main

/**
 * @brief Default handler is an infinite loop for all unsupported events
 *
 */
.section	.text.Default_Handler,"ax",%progbits
Default_Handler:
Infinite_Loop:
	b	Infinite_Loop
	.size	Default_Handler, .-Default_Handler

/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
    .macro    def_default_handler    handler_name
    .align 1
    .thumb_func
    .weak    \handler_name
    .thumb_set \handler_name,Default_Handler
    .endm

    /* Default handlers for Cortex M0 internal blocks */
    def_default_handler    NMI_Handler
    def_default_handler    HardFault_Handler
    def_default_handler    SVC_Handler
    def_default_handler    PendSV_Handler
    def_default_handler    time_irq /* SysTick_Handler */
    /* Default handlers for SAMC21 peripherals */
    def_default_handler    PM_Handler
    def_default_handler    WDT_Handler
    def_default_handler    RTC_Handler
    def_default_handler    EIC_Handler
    def_default_handler    FREQM_Handler
    def_default_handler    TSENS_Handler
    def_default_handler    NVMCTRL_Handler
    def_default_handler    DMAC_Handler
    def_default_handler    EVSYS_Handler
    def_default_handler    SERCOM0_Handler
    def_default_handler    SERCOM1_Handler
    def_default_handler    SERCOM2_Handler
    def_default_handler    SERCOM3_Handler
    def_default_handler    SERCOM4_Handler
    def_default_handler    SERCOM5_Handler
    def_default_handler    CAN0_Handler
    def_default_handler    CAN1_Handler
    def_default_handler    TCC0_Handler
    def_default_handler    TCC1_Handler
    def_default_handler    TCC2_Handler
    def_default_handler    TC0_Handler
    def_default_handler    TC1_Handler
    def_default_handler    TC2_Handler
    def_default_handler    TC3_Handler
    def_default_handler    TC4_Handler
    def_default_handler    ADC0_Handler
    def_default_handler    ADC1_Handler
    def_default_handler    AC_Handler
    def_default_handler    DAC_Handler
    def_default_handler    SDADC_Handler
    def_default_handler    PTC_Handler

.section .text.__gnu_thumb1_case_sqi
.global __gnu_thumb1_case_sqi
.thumb_func
__gnu_thumb1_case_sqi:
	mov     r12, r1
	mov     r1, lr
	lsrs    r1, r1, #1
	lsls    r1, r1, #1
	ldrsb   r1, [r1, r0]
	lsls    r1, r1, #1
	add     lr, lr, r1
	mov     r1, r12
	bx      lr

    .end
