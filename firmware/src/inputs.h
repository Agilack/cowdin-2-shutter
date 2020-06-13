/**
 * @file  inputs.h
 * @brief Definitions and prototypes for logical inputs module
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
#ifndef INPUTS_H
#define INPUTS_H

#define IN_1 1
#define IN_2 2

void inputs_init(void);
void inputs_refresh(void);
int  inputs_get(int channel);

#endif
