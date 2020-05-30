Cowdin Shutter Firmware
=======================

The cowdin-2-shutter board use an MCU (ATSAM-C family) to process events and
to manage outputs. This directory contains the software (firmware) for this
processor.

Inputs / Outputs
----------------

The main IOs of the board are:
 - Two logical inputs that should be connected to buttons somewhere into the
   building. This buttons can be pushed by user to request shutters to go up
   or down.
 - Four outputs with electromechanical relays (potential free contacts)
   connected to shutter motors to control them. There is two relays for each
   shutter : one to activate motor and one to control direction (up/down)
 - One can-bus communication interface (not used yet)

Operation
---------

As the PCB have not been produced yet, firmware is only a skeleton to test
principles using another hardware.

Both shutters works together. When user press button 1, both shutters are
started for a "go down" movement. When user press button 2, both shutters
are started for a "go up" movement.

There is no feeback from shutters to know there real position. Firmware use
only time to control outputs. Shutters can have different length and/or motors
can have different speed. To deal with this (possible) differences there is
two constants defined into the firmware to define shutter movement duration.

Compile
-------

Dependencies: to compile this firmware you need a gcc cross-compiler for arm
targets. The firmware have been tested with gcc-none-eabi version 5.4 but any
more recent version should work.

To compile firmware, just type `make`

To load firmware into target, we use `edbg` a very simple tool developped by
Alex Taradov. If you have this tool installed, you can load firmware using
`make load`. It should be also possible to use openocd ... or any other tool
for arm targets :p
