/**
 * @file  hardware.c
 * @brief Low-level hardware configuration
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
#include "hardware.h"

static inline void hw_init_clock(void);
static inline void hw_init_inputs(void);
static inline void hw_init_relay(void);

/**
 * @brief Low level initialization of processor and peripherals
 *
 * This function should be called on startup to do some basic
 * low-level intializations.
 */
void hw_init(void)
{
	hw_init_clock();
	hw_init_relay();
	hw_init_inputs();
}

/**
 * @brief Configure oscillators and Generic Clock Controller (GCLK)
 *
 */
static inline void hw_init_clock(void)
{
	/* Configure NVM wait states (2 for > 38MHz @ 5V) */
	reg_wr(NVM_ADDR + 0x04, (1 << 8) | (1 << 7) | (2 << 1));

	/* Switch to 48MHz : set CPU clock division to 1 (no division) */
	reg8_wr(MCLK_ADDR + 0x05, 1);
	/* Switch to 48MHz : clear 48M oscillator prescaler */
	reg8_wr(OSC_ADDR + 0x15, 0);
	while(reg_rd(OSC_ADDR + 0x18) & (1 << 2))
		;

	/* Set Divisor for GCLK0 : enabled, OSC48M, no divisor */
	reg_wr(GCLK_ADDR + 0x20, (0 << 16) | (1 << 11) | (1 << 8) | 0x06);
	/* Configure GCLK1 : enabled, OSC48M divided by 6  */
	reg_wr(GCLK_ADDR + 0x24, (6 << 16) | (1 << 8) | 0x06);
	/* Configure GCLK2 : disabled */
	reg_wr(GCLK_ADDR + 0x28, (0 << 8) );
	/* Configure GCLK3 : disabled */
	reg_wr(GCLK_ADDR + 0x2C, (0 << 8) );
	/* Configure GCLK4 : disabled */
	reg_wr(GCLK_ADDR + 0x30, (0 << 8) );
	/* Configure GCLK5 : disabled */
	reg_wr(GCLK_ADDR + 0x34, (0 << 8) );
	/* Configure GCLK6 : disabled */
	reg_wr(GCLK_ADDR + 0x38, (0 << 8) );
	/* Configure GCLK7 : disabled */
	reg_wr(GCLK_ADDR + 0x3C, (0 << 8) );
	/* Configure GCLK8 : disabled */
	reg_wr(GCLK_ADDR + 0x40, (0 << 8) );

#ifdef DEBUG_CLKIO
	/* PINCFG: Enable PMUX for GCLK0 pin */
	reg8_wr(PORTA_ADDR + 0x4E, 0x01); /* PA14 */
	/* Set peripheral function H (GCLK) for PA14 */
	reg8_wr(PORTA_ADDR + 0x37, (0x07 << 0));
#endif
}

/**
 * @brief Configure IOs used for logical inputs
 *
 */
static inline void hw_init_inputs(void)
{
	/* Configure IN 1 (PA17) */
	reg_wr (PORTA_ADDR + 0x04, (1 << 17)); // Disable output driver
	reg_wr (PORTA_ADDR + 0x18, (1 << 17)); // Set OUT=1 for pull-up
	reg8_wr(PORTA_ADDR + 0x51, 0x06); // PINCFG: use pull, enable input, no pmux

	/* Configure IN 2 (PA15) */
	reg_wr (PORTA_ADDR + 0x04, (1 << 15)); // Disable output driver
	reg_wr (PORTA_ADDR + 0x18, (1 << 15)); // Set OUT=1 for pull-up
	reg8_wr(PORTA_ADDR + 0x4F, 0x06); // PINCFG: use pull, enable input, no pmux
}

/**
 * @brief Configure IOs used to control relays
 *
 */
static inline void hw_init_relay(void)
{
	/* Configure Relay 1 (PA3) */
	reg_wr (PORTA_ADDR + 0x08, (1 << 3)); // Set PA3 as output
	reg_wr (PORTA_ADDR + 0x14, (1 << 3)); // Set default IO state to 0
	reg8_wr(PORTA_ADDR + 0x43, 0x40); // PINCFG: no pull, no pmux, high current
	/* Configure Relay 2 (PA2) */
	reg_wr (PORTA_ADDR + 0x08, (1 << 2)); // Set PA2 as output
	reg_wr (PORTA_ADDR + 0x14, (1 << 2)); // Set default IO state to 0
	reg8_wr(PORTA_ADDR + 0x42, 0x40); // PINCFG: no pull, no pmux, high current
	// Configure Relay 3 (PA1)
	reg_set(PORTA_ADDR + 0x08, (1 << 1)); // Set PA1 as output
	reg_wr (PORTA_ADDR + 0x14, (1 << 1)); // Set default IO state to 0
	reg8_wr(PORTA_ADDR + 0x41, 0x40); // PINCFG: no pull, no pmux, high current
	// Configure Relay 4 (PA7)
	reg_set(PORTA_ADDR + 0x08, (1 << 7)); // Set PA7 as output
	reg_wr (PORTA_ADDR + 0x14, (1 << 7)); // Set default IO state to 0
	reg8_wr(PORTA_ADDR + 0x47, 0x40); // PINCFG: no pull, no pmux, high current
}
/* EOF */
