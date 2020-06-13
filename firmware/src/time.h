/**
 * @file  time.h
 * @brief Definitions and prototypes for time functions
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
#ifndef TIME_H
#define TIME_H
#include "types.h"

void time_init(void);
u32  time_now(void);
void time_unload(void);

#endif
