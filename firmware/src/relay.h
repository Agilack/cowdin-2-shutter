/**
 * @file  relay.h
 * @brief Definitions and prototypes for relay outputs module
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
#ifndef RELAY_H
#define RELAY_H

#define SHUTTER_1    1
#define SHUTTER_2    2
#define SHUTTER_BOTH 3

#define DIR_UP   4
#define DIR_DOWN 5

void relay_init (void);
void relay_set_direction(int channel, int dir);
void relay_start(int channel);
void relay_stop (int channel);

#endif
