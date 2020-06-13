/**
 * @file  inputs.c
 * @brief Handle logical inputs
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
#include "inputs.h"
#include "types.h"

static int in1_last,    in2_last;
static int in1_pressed, in2_pressed;

/**
 * @brief Initialize the inputs module
 *
 * This function initialize internal variables and must be called before any
 * other function of inputs module.
 */
void inputs_init(void)
{
	in1_last = 0;
	in1_pressed = 0;
	in2_last = 0;
	in2_pressed = 0;
}

/**
 * @brief Synchronous refresh of inputs
 *
 * To avoid some problems into state machine, inputs values are periodically
 * refreshed and there states are saved into cache. All other functions use
 * this cached values so states are stable between two calls of refresh.
 */
void inputs_refresh(void)
{
	int in_state;

	// Read immediate state for input 1
	in_state = (reg_rd(PORTA_ADDR + 0x20) & (1 << 17)) == 0 ? 1 : 0;
	// Detect if button connected to input 1 have been pressed
	if (in_state && (in1_last == 0))
		in1_pressed = 1;
	else
		in1_pressed = 0;
	in1_last = in_state;

	// Read immediate state for input 2
	in_state = (reg_rd(PORTA_ADDR + 0x20) & (1 << 15)) == 0 ? 1 : 0;
	// Detect if button connected to input 2 have been pressed
	if (in_state && (in2_last == 0))
		in2_pressed = 1;
	else
		in2_pressed = 0;
	in2_last = in_state;

}

/**
 * @brief Read the (cached) state of an input
 *
 * @param channel Select input to read (1,2)
 * @return boolean State of the input (true when pressed)
 */
int inputs_get(int channel)
{
	if (channel == IN_1)
		return(in1_pressed);
	else if (channel == IN_2)
		return(in2_pressed);
	else
		return(0);
}
/* EOF */
