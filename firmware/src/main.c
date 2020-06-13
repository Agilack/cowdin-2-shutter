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
#include "inputs.h"
#include "relay.h"
#include "time.h"

#define REL1_DURATION (20 * 1000)
#define REL2_DURATION (20 * 1000)

static void fsm_idle(void);
static void fsm_closing(void);
static void fsm_opening(void);

static int shutter_state; // Finite State Machine
static int move_ts;       // Timestamp to compute movement duration

/**
 * @brief Entry point and main loop
 *
 */
int main(void)
{
	int tm_count;

	// Initialize drivers
	hw_init();
	time_init();
	// Initialize functional modules
	inputs_init();
	relay_init();

	// Wait 250ms after initializing inputs
	tm_count = time_now();
	while((time_now() - tm_count) < 250)
		;

	shutter_state = 0;

	// Infinite loop for the finite state machine (FSM)
	while(1)
	{
		inputs_refresh();

		switch(shutter_state)
		{
			// If shutter is currently IDLE
			case 0:
				fsm_idle();
				break;

			// If shutter is currently CLOSING
			case 1: // shutter 1
			case 2: // shutter 2
			case 3: // both
				fsm_closing();
				break;

			// If shutter is currently OPENING
			case 0x10: // shutter 1
			case 0x20: // shutter 2
			case 0x30: // both
				fsm_opening();
				break;

			// Unknown state (!) reset to defaults
			default:
			{
				// By default, shutters must be stop
				relay_stop(SHUTTER_1);
				relay_stop(SHUTTER_2);

				shutter_state = 0;
			}
		}
	}

	return(0);
}

/**
 * @brief Function called when FSM is in CLOSING state
 *
 * The FSM use CLOSING state if one or both shutter are currently moving to
 * their down position. This function manage movement duration and when all
 * shutters have finish, return to IDLE state.
 */
static void fsm_closing(void)
{
	int flag_stop1 = 0;
	int flag_stop2 = 0;

	// If one button is pressed again, stop
	if (inputs_get(IN_1) || inputs_get(IN_2))
	{
		flag_stop1 = 1;
		flag_stop2 = 1;
	}
	// One or both shutters are closing ...
	else
	{
		if((time_now() - move_ts) >= REL1_DURATION)
			flag_stop1 = 1;

		if((time_now() - move_ts) >= REL2_DURATION)
			flag_stop2 = 1;
	}

	if (flag_stop1)
	{
		// Stop shutter, now !
		relay_stop(SHUTTER_1);
		// Clear shutter 1 state
		shutter_state &= ~0x01;
	}
	if (flag_stop2)
	{
		// Stop shutter, now !
		relay_stop(SHUTTER_1);
		// Clear shutter 2 state
		shutter_state &= ~0x02;
	}
}

/**
 * @brief Function called when FSM is in IDLE state
 *
 * In IDLE state there is no operation in progress, the state machine wait for
 * an event (mainly from buttons) to do a transition to one active state.
 */
static void fsm_idle(void)
{
	if (inputs_get(IN_1))
	{
		// Start shutters
		relay_set_direction(SHUTTER_1, DIR_DOWN);
		relay_set_direction(SHUTTER_2, DIR_DOWN);
		relay_start(SHUTTER_BOTH);
		// Save current time
		move_ts = time_now();
		// Switch to CLOSING state
		shutter_state = 0x03;
	}
	if (inputs_get(IN_2))
	{
		// Start shutters
		relay_set_direction(SHUTTER_1, DIR_UP);
		relay_set_direction(SHUTTER_2, DIR_UP);
		relay_start(SHUTTER_BOTH);
		// Save current time
		move_ts = time_now();
		// Switch to OPENING state
		shutter_state = 0x30;
	}
}

/**
 * @brief Function called when FSM is in OPENING state
 *
 * The FSM use OPENING state if one or both shutter are currently moving to
 * their up position. This function manage movement duration and when all
 * shutters have finish, return to IDLE state.
 */
static void fsm_opening(void)
{
	int flag_stop1 = 0;
	int flag_stop2 = 0;

	// If one button is pressed again, stop
	if (inputs_get(IN_1) || inputs_get(IN_2))
	{
		flag_stop1 = 1;
		flag_stop2 = 1;
	}
	// One or both shutters are opening ...
	else
	{
		if((time_now() - move_ts) >= REL1_DURATION)
			flag_stop1 = 1;

		if((time_now() - move_ts) >= REL2_DURATION)
			flag_stop2 = 1;
	}

	if (flag_stop1)
	{
		// Stop shutter 1, now !
		relay_stop(SHUTTER_1);
		// Clear shutter 1 state
		shutter_state &= ~0x10;
	}

	if (flag_stop2)
	{
		// Stop shutter 2, now !
		relay_stop(SHUTTER_2);
		// Clear shutter 2 state
		shutter_state &= ~0x20;
	}
}
/* EOF */
