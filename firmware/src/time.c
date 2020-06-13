/**
 * @file  time.c
 * @brief Handle internal systick to manage time
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
#include "time.h"
#include "types.h"

static volatile u32 tm_tick;

/**
 * @brief Initialize time module
 *
 * The time module use Systick to create a 1kHz (1ms) time reference. To have a
 * precise value, tick is incremented on interrupt. This module *must* be unload
 * before modifying VTOR.
 */
void time_init(void)
{
	tm_tick = 0;

	/* Configure and start SysTick */
	reg_wr((u32)0xE000E014, 48000);
	reg_wr((u32)0xE000E010, (1 << 2) | (1 << 1) | 1);
}

/**
 * @brief Stop systick timer
 *
 */
void time_unload(void)
{
	/* Stop and reset SysTick */
	reg_wr((u32)0xE000E010, 0);
	reg_wr((u32)0xE000E014, 0);
}

/**
 * @brief Return the current value of tick counter
 *
 * @return u32 Number of 1ms tick since module started
 */
u32 time_now(void)
{
	return tm_tick;
}

/**
 * @brief Interrupt service routine for Systick
 *
 */
void time_irq(void)
{
	tm_tick ++;
}
/* EOF */
