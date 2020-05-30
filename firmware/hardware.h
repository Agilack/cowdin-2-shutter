/**
 * @file  hardware.h
 * @brief Definitions and prototypes for low-level hardware configuration
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
#ifndef HARDWARE_H
#define HARDWARE_H

/* AHB-APB Bridge A */
#define PAC0_ADDR    ((unsigned long)0x40000000)
#define PM_ADDR      ((unsigned long)0x40000400)
#define MCLK_ADDR    ((unsigned long)0x40000800)
#define RSTC_ADDR    ((unsigned long)0x40000C00)
#define OSC_ADDR     ((unsigned long)0x40001000)
#define OSC32_ADDR   ((unsigned long)0x40001400)
#define GCLK_ADDR    ((unsigned long)0x40001C00)
/* AHB-APB Bridge B */
#define PORTA_ADDR   ((unsigned long)0x41000000)
#define PORTB_ADDR   ((unsigned long)0x41000080)
#define NVM_ADDR     ((unsigned long)0x41004000)
/* AHB-APB Bridge C */
#define EVSYS_ADDR   ((unsigned long)0x42000000)

/**
 * @brief Read the value of a 32bits memory mapped register
 *
 * @param  reg Address of the register to read
 * @return unsigned long Value of the register (32 bits)
 */
static inline unsigned long reg_rd(unsigned long reg)
{
	return( *(volatile unsigned long *)reg );
}

/**
 * @brief Read the value of a 8bits memory mapped register
 *
 * @param  reg Address of the register to read
 * @return unsigned char  Value of the register (8 bits)
 */
static inline unsigned char reg8_rd(unsigned long reg)
{
	return( *(volatile unsigned char *)reg );
}

/**
 * @brief Read the value of a 16bits memory mapped register
 *
 * @param  reg Address of the register to read
 * @return unsigned short Value of the register (16 bits)
 */
static inline unsigned short reg16_rd(unsigned long reg)
{
	return( *(volatile unsigned short *)reg );
}

/**
 * @brief Write a 32 bits value to a memory mapped register
 *
 * @param reg   Address of the register to update
 * @param value New value to write into the register
 */
static inline void reg_wr(unsigned long reg, unsigned long value)
{
	*(volatile unsigned long *)reg = value;
}

/**
 * @brief Write a 16bits value to a memory mapped register
 *
 * @param reg   Address of the register to update
 * @param value New (16 bits) value to write into the register
 */
static inline void reg16_wr (unsigned long reg, unsigned short value)
{
	*(volatile unsigned short *)reg = value;
}

/**
 * @brief Write a 8bits value to a memory mapped register
 *
 * @param reg   Address of the register to update
 * @param value New (8 bits) value to write into the register
 */
static inline void reg8_wr(unsigned long reg, unsigned char value)
{
	*(volatile unsigned char *)reg = value;
}

/**
 * @brief Set some bits into a memory mapped register
 *
 * @param reg   Address of the register to update
 * @param value Mask of bits to set into the register
 */
static inline void reg_set(unsigned long reg, unsigned long value)
{
	*(volatile unsigned long *)reg = (*(volatile unsigned long *)reg | value);
}

#endif
