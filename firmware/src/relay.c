/**
 * @file  relay.c
 * @brief Manage electromechanical relay (outputs)
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
#include "relay.h"
#include "time.h"

static int shutter1_dir;
static int shutter2_dir;

/**
 * @brief Initialize the relay module
 *
 * This function initialize internal variables and must be called before any
 * other function of relay module.
 */
void relay_init(void)
{
	shutter1_dir = DIR_DOWN;
	shutter2_dir = DIR_DOWN;
}

/**
 * @brief Define the motor direction for the next movement
 *
 * Starting shutter motor is a two step operation : 1) activate the direction
 * relay, 2) activate the motor relay. To take care about relay switching time,
 * a small delay is inserted between this two steps (this also reduce surge)
 * This function does *not* start the shutter but allow to define direction to
 * use for the net movement.
 *
 * @param channel Shutter to configure
 * @param dir     Direction for the next run
 */
void relay_set_direction(int channel, int dir)
{
	// Sanity check
	if ((dir != DIR_DOWN) && (dir != DIR_UP))
		// TODO Assert error
		return;

	switch (channel)
	{
		case SHUTTER_1:
			shutter1_dir = dir;
			break;
		case SHUTTER_2:
			shutter2_dir = dir;
			break;
		case SHUTTER_BOTH:
			shutter1_dir = dir;
			shutter2_dir = dir;
			break;
		default:
			// TODO Assert error
			break;
	}
}

/**
 * @brief Start one (or both) shutter
 *
 * @param channel Shutter(s) to start
 */
void relay_start(int channel)
{
	int use_s1, use_s2;
	int tm_count;

	use_s1 = ((channel == SHUTTER_1) || (channel == SHUTTER_BOTH)) ? 1 : 0;
	use_s2 = ((channel == SHUTTER_2) || (channel == SHUTTER_BOTH)) ? 1 : 0;

	// If shutter 1 is selected and need to go UP, activate RL2
	if (use_s1 && (shutter1_dir == DIR_UP))
		reg_wr (PORTA_ADDR + 0x18, (1 << 2));
	// If shutter 2 is selected and need to go UP, activate RL4
	if (use_s2 && (shutter2_dir == DIR_UP))
		reg_wr (PORTA_ADDR + 0x18, (1 << 7));

	// Wait 100 msec before starting motors
	tm_count = time_now();
	while((time_now() - tm_count) < 100)
		;

	// If shutter 1 is selected, start it (activate RL1)
	if (use_s1)
		reg_wr (PORTA_ADDR + 0x18, (1 << 3));
	// If shutter 2 is selected, start it (activate RL3)
	if (use_s2)
		reg_wr (PORTA_ADDR + 0x18, (1 << 1));
}

/**
 * @brief Stop one (or both) shutter
 *
 * @param channel Shutter to stop
 */
void relay_stop(int channel)
{
	// If shutter 1 need to be stop
	if ((channel == SHUTTER_1) || (channel == SHUTTER_BOTH))
	{
		// Set RL1 "OFF" (stop shutter 1)
		reg_wr(PORTA_ADDR + 0x14, (1 << 3));
		// Set RL2 "OFF" (reset direction)
		reg_wr(PORTA_ADDR + 0x14, (1 << 2));

		shutter1_dir = DIR_DOWN;
	}

	// If shutter 2 need to be stop
	if ((channel == SHUTTER_2) || (channel == SHUTTER_BOTH))
	{
		// Set RL3 "OFF" (stop shutter 2)
		reg_wr(PORTA_ADDR + 0x14, (1 << 1));
		// Set RL4 "OFF" (reset direction)
		reg_wr(PORTA_ADDR + 0x14, (1 << 7));

		shutter1_dir = DIR_DOWN;
	}
}
/* EOF */
