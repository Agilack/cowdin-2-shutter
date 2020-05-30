/**
 * @file  main.c
 * @brief Main function (entry point) of the firmware
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

#define REL1_DURATION (20 * 1000)
#define REL2_DURATION (20 * 1000)

volatile unsigned long tm_tick;

/**
 * @brief Entry point and main loop
 *
 */
int main(void)
{
	int but1, but1_last, but1_pressed;
	int but2, but2_last, but2_pressed;
	int shutter_state;
	int tm_count;

	// Configure NVM wait states (2 for > 38MHz @ 5V)
	reg_wr(NVM_ADDR + 0x04, (1 << 8) | (1 << 7) | (2 << 1));
	// Switch to 48MHz : set CPU clock division to 1 (no division)
	reg8_wr(MCLK_ADDR + 0x05, 1);
	// Switch to 48MHz : clear 48M oscillator prescaler
	reg8_wr(OSC_ADDR + 0x15, 0);
	while(reg_rd(OSC_ADDR + 0x18) & (1 << 2))
		;
	// Set Divisor for GCLK0 : enabled, OSC48M, no divisor
	reg_wr(GCLK_ADDR + 0x20, (0 << 16) | (1 << 11) | (1 << 8) | 0x06);
	// Configure GCLK1 : enabled, OSC48M divided by 6
	reg_wr(GCLK_ADDR + 0x24, (6 << 16) | (1 << 8) | 0x06);

	// Configure Relay 1 (PA3)
	reg_set(PORTA_ADDR + 0x08, (1 << 3)); // Set PA3 as output
	reg_wr (PORTA_ADDR + 0x14, (1 << 3)); // Set default IO state to 0
	reg8_wr(PORTA_ADDR + 0x43, 0x40); // PINCFG: no pull, no pmux, high current
	// Configure Relay 2 (PA2)
	reg_set(PORTA_ADDR + 0x08, (1 << 2)); // Set PA2 as output
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

	// Configure IN 1 (PA17)
	reg_wr (PORTA_ADDR + 0x04, (1 << 17)); // Disable output driver
	reg_wr (PORTA_ADDR + 0x18, (1 << 17)); // Set OUT=1 for pull-up
	reg8_wr(PORTA_ADDR + 0x51, 0x06); // PINCFG: use pull, enable input, no pmux
	// Configure IN 2 (PA15)
	reg_wr (PORTA_ADDR + 0x04, (1 << 15)); // Disable output driver
	reg_wr (PORTA_ADDR + 0x18, (1 << 15)); // Set OUT=1 for pull-up
	reg8_wr(PORTA_ADDR + 0x4F, 0x06); // PINCFG: use pull, enable input, no pmux

	// Initialize time counter and start SysTick
	tm_tick = 0;
	reg_wr((unsigned long)0xE000E014, 48000);
	reg_wr((unsigned long)0xE000E010, (1 << 2) | (1 << 1) | 1);

	// Wait 250ms after initializing inputs
	tm_count = tm_tick;
	while((tm_tick - tm_count) < 250)
		;

	but1_last = 0;
	but2_last = 0;
	shutter_state = 0;

	while(1)
	{
		but1 = (reg_rd(PORTA_ADDR + 0x20) & (1 << 17)) == 0 ? 1 : 0;
		but2 = (reg_rd(PORTA_ADDR + 0x20) & (1 << 15)) == 0 ? 1 : 0;

		// Detect button1 pressed event
		if (but1 && (but1_last == 0))
			but1_pressed = 1;
		else
			but1_pressed = 0;
		but1_last = but1;
		// Detect button2 pressed event
		if (but2 && (but2_last == 0))
			but2_pressed = 1;
		else
			but2_pressed = 0;
		but2_last = but2;

		// If shutter is currently IDLE
		if (shutter_state == 0)
		{
			if (but1_pressed)
			{
				// Set RL1 "ON" (run shutter 1)
				reg_wr (PORTA_ADDR + 0x18, (1 << 3));
				// Set RL3 "ON" (run shutter 2)
				reg_wr (PORTA_ADDR + 0x18, (1 << 1));
				// Save current time
				tm_count = tm_tick;
				// Switch to CLOSING state
				shutter_state = 0x03;
			}
			if (but2_pressed)
			{
				// Set RL2 "ON" (shutter 1 direction UP)
				reg_wr (PORTA_ADDR + 0x18, (1 << 2));
				// Set RL4 "ON" (shutter 2 direction UP)
				reg_wr (PORTA_ADDR + 0x18, (1 << 7));
				// Wait 100 msec before starting motors
				tm_count = tm_tick;
				while((tm_tick - tm_count) < 100)
					;
				// Set RL1 "ON" (run shutter 1)
				reg_wr (PORTA_ADDR + 0x18, (1 << 3));
				// Set RL3 "ON" (run shutter 2)
				reg_wr (PORTA_ADDR + 0x18, (1 << 1));
				// Save current time
				tm_count = tm_tick;
				// Switch to OPENING state
				shutter_state = 0x30;
			}
		}
		// If shutter is closing
		else if (shutter_state & 0x0F)
		{
			int flag_stop1 = 0;
			int flag_stop2 = 0;

			// If one button is pressed again, stop
			if (but1_pressed || but2_pressed)
			{
				flag_stop1 = 1;
				flag_stop2 = 1;
				shutter_state &= ~0x0F;
			}
			// One or both shutters are closing ...
			else
			{
				if((tm_tick - tm_count) >= REL1_DURATION)
				{
					flag_stop1 = 1;
					// Clear shutter 1 state
					shutter_state &= ~0x01;
				}
				if((tm_tick - tm_count) >= REL2_DURATION)
				{
					flag_stop2 = 1;
					// Clear shutter 2 state
					shutter_state &= ~0x02;
				}
			}

			// Set RL1 "OFF" (stop shutter 1)
			if (flag_stop1)
				reg_wr(PORTA_ADDR + 0x14, (1 << 3));
			// Set RL3 "OFF" (stop shutter 2)
			if (flag_stop2)
				reg_wr(PORTA_ADDR + 0x14, (1 << 1));
		}
		// If shutter is opening
		else if (shutter_state & 0xF0)
		{
			int flag_stop1 = 0;
			int flag_stop2 = 0;

			// If one button is pressed again, stop
			if (but1_pressed || but2_pressed)
			{
				flag_stop1 = 1;
				flag_stop2 = 1;
				shutter_state &= ~0xF0;
			}
			// One or both shutters are opening ...
			else
			{
				if((tm_tick - tm_count) >= REL1_DURATION)
				{
					flag_stop1 = 1;
					// Clear shutter 1 state
					shutter_state &= ~0x10;
				}
				if((tm_tick - tm_count) >= REL2_DURATION)
				{
					flag_stop2 = 1;
					// Clear shutter 2 state
					shutter_state &= ~0x20;
				}
			}
			
			if (flag_stop1)
			{
				// Set RL1 "OFF" (stop shutter 1)
				reg_wr(PORTA_ADDR + 0x14, (1 << 3));
				// Set RL2 "OFF" (reset direction)
				reg_wr(PORTA_ADDR + 0x14, (1 << 2));
			}
			
			if (flag_stop2)
			{
				// Set RL3 "OFF" (stop shutter 2)
				reg_wr(PORTA_ADDR + 0x14, (1 << 1));
				// Set RL4 "OFF" (reset direction)
				reg_wr(PORTA_ADDR + 0x14, (1 << 7));
			}
		}
		// Unknown state (!) reset to defaults
		else
		{
			// Set RL1 "OFF" (shutter is stopped by default)
			reg_wr(PORTA_ADDR + 0x14, (1 << 3));
			// Set RL2 "OFF" (default direction)
			reg_wr(PORTA_ADDR + 0x14, (1 << 2));

			// Set RL3 "OFF" (shutter is stopped by default)
			reg_wr(PORTA_ADDR + 0x14, (1 << 1));
			// Set RL4 "OFF" (default direction)
			reg_wr(PORTA_ADDR + 0x14, (1 << 7));

			shutter_state = 0;
		}
	}

	return(0);
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
