EESchema Schematic File Version 4
LIBS:cowdin-2-shutter-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "CowDIN 2 Shutter"
Date "2020-05-19"
Rev "1"
Comp "Agilack"
Comment1 "CC-by-SA"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L cowdin-2-shutter:CONN_3 P1
U 1 1 5EC3E1BD
P 950 3700
F 0 "P1" H 950 3350 60  0000 C CNN
F 1 "CONN_3" V 950 3700 40  0000 C CNN
F 2 "cowdin-2-shutter:CONN_MC000035" H 950 3700 60  0001 C CNN
F 3 "" H 950 3700 60  0000 C CNN
	1    950  3700
	-1   0    0    1   
$EndComp
$Comp
L cowdin-2-shutter:CONN_3 P3
U 1 1 5EC3E2B2
P 950 3000
F 0 "P3" H 950 2650 60  0000 C CNN
F 1 "CONN_3" V 950 3000 40  0000 C CNN
F 2 "cowdin-2-shutter:CONN_MC000035" H 950 3000 60  0001 C CNN
F 3 "" H 950 3000 60  0000 C CNN
	1    950  3000
	-1   0    0    1   
$EndComp
$Comp
L cowdin-2-shutter:CONN_3 P2
U 1 1 5EC3E5BD
P 10700 3700
F 0 "P2" H 10700 3350 60  0000 C CNN
F 1 "CONN_3" V 10700 3700 40  0000 C CNN
F 2 "cowdin-2-shutter:CONN_691411710003" H 10700 3700 60  0001 C CNN
F 3 "" H 10700 3700 60  0000 C CNN
	1    10700 3700
	1    0    0    1   
$EndComp
$Comp
L cowdin-2-shutter:CONN_3 P4
U 1 1 5EC3E6B7
P 10700 3000
F 0 "P4" H 10700 2650 60  0000 C CNN
F 1 "CONN_3" V 10700 3000 40  0000 C CNN
F 2 "cowdin-2-shutter:CONN_691411710003" H 10700 3000 60  0001 C CNN
F 3 "" H 10700 3000 60  0000 C CNN
	1    10700 3000
	1    0    0    1   
$EndComp
$Comp
L cowdin-2-shutter:RELAY RL1
U 1 1 5EC401D4
P 8500 4950
F 0 "RL1" H 8300 4650 50  0000 C CNN
F 1 "RELAY" H 8300 5200 50  0000 C CNN
F 2 "cowdin-2-shutter:RL_3451" H 8500 4950 50  0001 C CNN
F 3 "" H 8500 4950 50  0000 C CNN
	1    8500 4950
	1    0    0    1   
$EndComp
$Comp
L cowdin-2-shutter:RELAY RL2
U 1 1 5EC4025E
P 8500 4150
F 0 "RL2" H 8300 4450 50  0000 C CNN
F 1 "RELAY" H 8300 3900 50  0000 C CNN
F 2 "cowdin-2-shutter:RL_3451" H 8500 4150 50  0001 C CNN
F 3 "" H 8500 4150 50  0000 C CNN
	1    8500 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 3550 8600 3550
Wire Wire Line
	8600 3550 8600 3850
Wire Wire Line
	10350 3700 8800 3700
Wire Wire Line
	8800 3700 8800 3850
Wire Wire Line
	9700 5350 9700 3850
Wire Wire Line
	9700 3850 10350 3850
$Comp
L cowdin-2-shutter:RELAY RL3
U 1 1 5EC4081D
P 8500 2550
F 0 "RL3" H 8300 2850 50  0000 C CNN
F 1 "RELAY" H 8300 2300 50  0000 C CNN
F 2 "cowdin-2-shutter:RL_3451" H 8500 2550 50  0001 C CNN
F 3 "" H 8500 2550 50  0000 C CNN
	1    8500 2550
	1    0    0    1   
$EndComp
$Comp
L cowdin-2-shutter:RELAY RL4
U 1 1 5EC40915
P 8500 1750
F 0 "RL4" H 8300 2050 50  0000 C CNN
F 1 "RELAY" H 8300 1500 50  0000 C CNN
F 2 "cowdin-2-shutter:RL_3451" H 8500 1750 50  0001 C CNN
F 3 "" H 8500 1750 50  0000 C CNN
	1    8500 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 2850 10150 2850
Wire Wire Line
	10350 3000 9950 3000
Wire Wire Line
	9950 3000 9950 1350
Wire Wire Line
	9950 1350 8800 1350
Wire Wire Line
	8800 1350 8800 1450
Wire Wire Line
	8600 1150 10150 1150
Wire Wire Line
	10150 1150 10150 2850
Wire Wire Line
	8600 1150 8600 1450
Wire Wire Line
	8700 4450 8700 4650
Wire Wire Line
	9700 5350 8800 5350
Wire Wire Line
	8800 5350 8800 5250
Wire Wire Line
	8700 2050 8700 2250
NoConn ~ 8600 2850
Wire Wire Line
	8800 2850 8800 3150
Wire Wire Line
	8800 3150 10350 3150
$Comp
L cowdin-2-shutter:TPS54060A U3
U 1 1 5BEEBEAF
P 2550 6050
F 0 "U3" H 2550 6600 60  0000 C CNN
F 1 "TPS54060A" V 2550 6050 60  0000 C CNN
F 2 "cowdin-2-shutter:MSOP10p" H 2550 6000 60  0001 C CNN
F 3 "" H 2550 6000 60  0000 C CNN
F 4 "Texas Instruments" H 2550 6050 60  0001 C CNN "Manufacturer"
F 5 "TPS54060ADGQ" H 2550 6050 60  0001 C CNN "Manuf Ref"
F 6 "Farnell" H 2550 6050 60  0001 C CNN "Distributor"
F 7 "2099922" H 2550 6050 60  0001 C CNN "Distrib Ref"
	1    2550 6050
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:C C10
U 1 1 5BEEBF7E
P 1150 6000
F 0 "C10" H 1050 6100 50  0000 R CNN
F 1 "10uF" H 1050 5900 50  0000 R CNN
F 2 "cowdin-2-shutter:SMD1210" H 1150 6000 60  0001 C CNN
F 3 "" H 1150 6000 60  0000 C CNN
F 4 "Murata" H 1150 6000 60  0001 C CNN "Manufacturer"
F 5 "GRT31CR61H106KE01L" H 1150 6000 60  0001 C CNN "Manuf Ref"
F 6 "Farnell" H 1150 6000 60  0001 C CNN "Distributor"
F 7 "2672214" H 1150 6000 60  0001 C CNN "Distrib Ref"
	1    1150 6000
	1    0    0    -1  
$EndComp
NoConn ~ 2000 5950
Wire Wire Line
	1150 5700 1150 5800
$Comp
L cowdin-2-shutter:GND #PWR035
U 1 1 5BEED761
P 1150 6300
F 0 "#PWR035" H 1150 6300 30  0001 C CNN
F 1 "GND" H 1150 6230 30  0001 C CNN
F 2 "" H 1150 6300 60  0000 C CNN
F 3 "" H 1150 6300 60  0000 C CNN
	1    1150 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 6300 1150 6200
$Comp
L cowdin-2-shutter:C C12
U 1 1 5BEFE71E
P 1650 6700
F 0 "C12" H 1450 6800 50  0000 L CNN
F 1 "10nF" H 1600 6600 50  0000 R CNN
F 2 "cowdin-2-shutter:SMD0603" H 1650 6700 60  0001 C CNN
F 3 "" H 1650 6700 60  0000 C CNN
	1    1650 6700
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:R R14
U 1 1 5BEFE7B9
P 1900 6700
F 0 "R14" V 2000 6700 50  0000 C CNN
F 1 "100k" V 1900 6700 45  0000 C CNN
F 2 "cowdin-2-shutter:SMD0603" H 1900 6700 60  0001 C CNN
F 3 "" H 1900 6700 60  0000 C CNN
	1    1900 6700
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR036
U 1 1 5BEFE835
P 1900 7000
F 0 "#PWR036" H 1900 7000 30  0001 C CNN
F 1 "GND" H 1900 6930 30  0001 C CNN
F 2 "" H 1900 7000 60  0000 C CNN
F 3 "" H 1900 7000 60  0000 C CNN
	1    1900 7000
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR037
U 1 1 5BEFE863
P 1650 7000
F 0 "#PWR037" H 1650 7000 30  0001 C CNN
F 1 "GND" H 1650 6930 30  0001 C CNN
F 2 "" H 1650 7000 60  0000 C CNN
F 3 "" H 1650 7000 60  0000 C CNN
	1    1650 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 7000 1650 6900
Wire Wire Line
	1900 7000 1900 6950
Wire Wire Line
	1900 6450 1900 6350
Wire Wire Line
	1900 6350 2000 6350
Wire Wire Line
	1650 6500 1650 6150
Wire Wire Line
	1650 6150 2000 6150
$Comp
L cowdin-2-shutter:C C11
U 1 1 5BEFEFCF
P 1450 6000
F 0 "C11" H 1500 6100 50  0000 L CNN
F 1 "C" H 1500 5900 50  0000 L CNN
F 2 "cowdin-2-shutter:SMD1210" H 1450 6000 60  0001 C CNN
F 3 "" H 1450 6000 60  0000 C CNN
	1    1450 6000
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR038
U 1 1 5BEFF06C
P 1450 6300
F 0 "#PWR038" H 1450 6300 30  0001 C CNN
F 1 "GND" H 1450 6230 30  0001 C CNN
F 2 "" H 1450 6300 60  0000 C CNN
F 3 "" H 1450 6300 60  0000 C CNN
	1    1450 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 6300 1450 6200
Wire Wire Line
	1450 5700 1450 5800
Connection ~ 1450 5700
$Comp
L cowdin-2-shutter:C C13
U 1 1 5BF00D16
P 3400 5700
F 0 "C13" V 3600 5700 50  0000 C CNN
F 1 "100nF" V 3450 5600 50  0000 R CNN
F 2 "cowdin-2-shutter:SMD0603" H 3400 5700 60  0001 C CNN
F 3 "" H 3400 5700 60  0000 C CNN
	1    3400 5700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 5700 3100 5700
Wire Wire Line
	3100 5900 3700 5900
Wire Wire Line
	3700 5900 3700 5700
Wire Wire Line
	3700 5700 3600 5700
$Comp
L cowdin-2-shutter:D_Schottky D12
U 1 1 5BF01167
P 3800 6100
F 0 "D12" H 3800 6200 50  0000 C CNN
F 1 "MBRA340" H 3800 6000 30  0000 C CNN
F 2 "cowdin-2-shutter:DO214AC" H 3800 6100 50  0001 C CNN
F 3 "" H 3800 6100 50  0000 C CNN
F 4 "Bourns" H 3800 6100 60  0001 C CNN "Manufacturer"
F 5 "CD214A-B160LF" H 3800 6100 60  0001 C CNN "Manuf Ref"
F 6 "Farnell" H 3800 6100 60  0001 C CNN "Distributor"
F 7 "2369238" H 3800 6100 60  0001 C CNN "Distrib Ref"
	1    3800 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 5900 3800 5950
Connection ~ 3700 5900
Wire Wire Line
	3800 6300 3800 6250
$Comp
L cowdin-2-shutter:GND #PWR039
U 1 1 5BF02DF2
P 3800 6300
F 0 "#PWR039" H 3800 6300 30  0001 C CNN
F 1 "GND" H 3800 6230 30  0001 C CNN
F 2 "" H 3800 6300 60  0000 C CNN
F 3 "" H 3800 6300 60  0000 C CNN
	1    3800 6300
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR040
U 1 1 5BF02EA8
P 2450 6700
F 0 "#PWR040" H 2450 6700 30  0001 C CNN
F 1 "GND" H 2450 6630 30  0001 C CNN
F 2 "" H 2450 6700 60  0000 C CNN
F 3 "" H 2450 6700 60  0000 C CNN
	1    2450 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6700 2450 6650
Wire Wire Line
	2650 6700 2650 6650
$Comp
L cowdin-2-shutter:GND #PWR041
U 1 1 5BF02F7F
P 2650 6700
F 0 "#PWR041" H 2650 6700 30  0001 C CNN
F 1 "GND" H 2650 6630 30  0001 C CNN
F 2 "" H 2650 6700 60  0000 C CNN
F 3 "" H 2650 6700 60  0000 C CNN
	1    2650 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 6400 3100 6400
Wire Wire Line
	3300 6500 3300 6400
Wire Wire Line
	3150 6500 3300 6500
$Comp
L cowdin-2-shutter:R R15
U 1 1 5BF060CB
P 3450 6800
F 0 "R15" V 3550 6800 50  0000 C CNN
F 1 "20k" V 3450 6800 45  0000 C CNN
F 2 "cowdin-2-shutter:SMD0603" H 3450 6800 60  0001 C CNN
F 3 "" H 3450 6800 60  0000 C CNN
	1    3450 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6500 3450 6550
NoConn ~ 3100 6250
$Comp
L cowdin-2-shutter:C C15
U 1 1 5BF06304
P 3450 7350
F 0 "C15" H 3500 7450 50  0000 L CNN
F 1 "4,7nF" H 3500 7250 50  0000 L CNN
F 2 "cowdin-2-shutter:SMD0603" H 3450 7350 60  0001 C CNN
F 3 "" H 3450 7350 60  0000 C CNN
	1    3450 7350
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:C C14
U 1 1 5BF063A1
P 3150 7100
F 0 "C14" H 3200 7200 50  0000 L CNN
F 1 "n/a" H 3200 7000 50  0000 L CNN
F 2 "cowdin-2-shutter:SMD0603" H 3150 7100 60  0001 C CNN
F 3 "" H 3150 7100 60  0000 C CNN
	1    3150 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 7550 3450 7600
Wire Wire Line
	3450 7600 3300 7600
Wire Wire Line
	3150 7600 3150 7300
Wire Wire Line
	3150 6900 3150 6500
Connection ~ 3300 6500
Wire Wire Line
	3450 7050 3450 7150
Wire Wire Line
	3300 7650 3300 7600
Connection ~ 3300 7600
$Comp
L cowdin-2-shutter:GND #PWR043
U 1 1 5BF065EF
P 3300 7650
F 0 "#PWR043" H 3300 7650 30  0001 C CNN
F 1 "GND" H 3300 7580 30  0001 C CNN
F 2 "" H 3300 7650 60  0000 C CNN
F 3 "" H 3300 7650 60  0000 C CNN
	1    3300 7650
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:INDUCTOR L11
U 1 1 5BF067BB
P 4200 5900
F 0 "L11" V 4300 5900 50  0000 C CNN
F 1 "27uH" V 4150 5900 40  0000 C CNN
F 2 "cowdin-2-shutter:I_MSS1048" H 4200 5900 60  0001 C CNN
F 3 "" H 4200 5900 60  0000 C CNN
F 4 "Coilcraft" V 4200 5900 60  0001 C CNN "Manufacturer"
F 5 "MSS1038-273MLC" V 4200 5900 60  0001 C CNN "Manuf Ref"
F 6 "Farnell" V 4200 5900 60  0001 C CNN "Distributor"
F 7 "2288210" V 4200 5900 60  0001 C CNN "Distrib Ref"
	1    4200 5900
	0    -1   -1   0   
$EndComp
Connection ~ 3800 5900
$Comp
L cowdin-2-shutter:R R16
U 1 1 5BF0840D
P 4300 6350
F 0 "R16" V 4400 6350 50  0000 C CNN
F 1 "52,3k" V 4300 6350 45  0000 C CNN
F 2 "cowdin-2-shutter:SMD0603" H 4300 6350 60  0001 C CNN
F 3 "" H 4300 6350 60  0000 C CNN
	1    4300 6350
	0    1    1    0   
$EndComp
$Comp
L cowdin-2-shutter:R R17
U 1 1 5BF09CF9
P 4300 6650
F 0 "R17" V 4400 6650 50  0000 C CNN
F 1 "10k" V 4300 6650 45  0000 C CNN
F 2 "cowdin-2-shutter:SMD0603" H 4300 6650 60  0001 C CNN
F 3 "" H 4300 6650 60  0000 C CNN
	1    4300 6650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3600 6500 3600 6100
Wire Wire Line
	3600 6100 3100 6100
$Comp
L cowdin-2-shutter:GND #PWR044
U 1 1 5BF09F13
P 4700 6750
F 0 "#PWR044" H 4700 6750 30  0001 C CNN
F 1 "GND" H 4700 6680 30  0001 C CNN
F 2 "" H 4700 6750 60  0000 C CNN
F 3 "" H 4700 6750 60  0000 C CNN
	1    4700 6750
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:CP C16
U 1 1 5BF0B843
P 5000 6200
F 0 "C16" H 5050 6300 50  0000 L CNN
F 1 "220uF" H 5050 6100 50  0000 L CNN
F 2 "cowdin-2-shutter:C_TPB_D4" H 5000 6200 60  0001 C CNN
F 3 "" H 5000 6200 60  0000 C CNN
	1    5000 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5900 5000 6000
Wire Wire Line
	5000 6400 5000 6450
$Comp
L cowdin-2-shutter:GND #PWR045
U 1 1 5BF0B994
P 5000 6450
F 0 "#PWR045" H 5000 6450 30  0001 C CNN
F 1 "GND" H 5000 6380 30  0001 C CNN
F 2 "" H 5000 6450 60  0000 C CNN
F 3 "" H 5000 6450 60  0000 C CNN
	1    5000 6450
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:+5V #PWR046
U 1 1 5BF0BA6A
P 5300 5800
F 0 "#PWR046" H 5300 5760 30  0001 C CNN
F 1 "+5V" H 5300 5910 30  0000 C CNN
F 2 "" H 5300 5800 60  0000 C CNN
F 3 "" H 5300 5800 60  0000 C CNN
	1    5300 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 5900 5300 5800
Connection ~ 5000 5900
Text Label 3450 5900 0    45   ~ 0
V5_SW
Wire Wire Line
	1150 5700 1450 5700
Wire Wire Line
	1450 5700 2000 5700
Wire Wire Line
	3700 5900 3800 5900
Wire Wire Line
	3300 6500 3450 6500
Wire Wire Line
	3300 7600 3150 7600
Wire Wire Line
	3800 5900 3900 5900
Wire Wire Line
	5000 5900 5300 5900
$Comp
L cowdin-2-shutter:+VIn #PWR0101
U 1 1 5EC6966B
P 950 5600
F 0 "#PWR0101" H 950 5560 30  0001 C CNN
F 1 "+VIn" H 959 5738 30  0000 C CNN
F 2 "" H 950 5600 60  0000 C CNN
F 3 "" H 950 5600 60  0000 C CNN
	1    950  5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  5600 950  5700
Wire Wire Line
	950  5700 1150 5700
Connection ~ 1150 5700
Wire Wire Line
	1400 3850 1300 3850
$Comp
L cowdin-2-shutter:GND #PWR0103
U 1 1 5EC72EB8
P 1400 4000
F 0 "#PWR0103" H 1400 4000 30  0001 C CNN
F 1 "GND" H 1400 3930 30  0001 C CNN
F 2 "" H 1400 4000 60  0000 C CNN
F 3 "" H 1400 4000 60  0000 C CNN
	1    1400 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3800 1700 3900
Wire Wire Line
	1500 3700 1300 3700
Wire Wire Line
	1500 3900 1700 3900
Wire Wire Line
	1500 3700 1500 3900
Wire Wire Line
	1400 3850 1400 4000
$Comp
L cowdin-2-shutter:+VIn #PWR0102
U 1 1 5EC5CF3B
P 1700 3800
F 0 "#PWR0102" H 1700 3760 30  0001 C CNN
F 1 "+VIn" H 1709 3938 30  0000 C CNN
F 2 "" H 1700 3800 60  0000 C CNN
F 3 "" H 1700 3800 60  0000 C CNN
	1    1700 3800
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:ATSAMC21J U1
U 1 1 5EC74264
P 3300 2050
F 0 "U1" H 3600 3050 60  0000 C CNN
F 1 "ATSAMC21J" H 3750 1050 60  0000 C CNN
F 2 "cowdin-2-shutter:TQFP64" H 3300 1900 60  0001 C CNN
F 3 "" H 3300 1900 60  0000 C CNN
	1    3300 2050
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:ATSAMC21J U1
U 2 1 5EC744FF
P 5400 2050
F 0 "U1" H 5050 2950 60  0000 C CNN
F 1 "ATSAMC21J" H 5750 1150 60  0000 C CNN
F 2 "cowdin-2-shutter:TQFP64" H 5400 1900 60  0001 C CNN
F 3 "" H 5400 1900 60  0000 C CNN
	2    5400 2050
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR0104
U 1 1 5EC7637F
P 3150 3150
F 0 "#PWR0104" H 3150 3150 30  0001 C CNN
F 1 "GND" H 3150 3080 30  0001 C CNN
F 2 "" H 3150 3150 60  0000 C CNN
F 3 "" H 3150 3150 60  0000 C CNN
	1    3150 3150
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR0105
U 1 1 5EC763E9
P 3250 3150
F 0 "#PWR0105" H 3250 3150 30  0001 C CNN
F 1 "GND" H 3250 3080 30  0001 C CNN
F 2 "" H 3250 3150 60  0000 C CNN
F 3 "" H 3250 3150 60  0000 C CNN
	1    3250 3150
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR0106
U 1 1 5EC76453
P 3350 3150
F 0 "#PWR0106" H 3350 3150 30  0001 C CNN
F 1 "GND" H 3350 3080 30  0001 C CNN
F 2 "" H 3350 3150 60  0000 C CNN
F 3 "" H 3350 3150 60  0000 C CNN
	1    3350 3150
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR0107
U 1 1 5EC764BD
P 3450 3150
F 0 "#PWR0107" H 3450 3150 30  0001 C CNN
F 1 "GND" H 3450 3080 30  0001 C CNN
F 2 "" H 3450 3150 60  0000 C CNN
F 3 "" H 3450 3150 60  0000 C CNN
	1    3450 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3150 3150 3100
Wire Wire Line
	3250 3100 3250 3150
Wire Wire Line
	3350 3150 3350 3100
Wire Wire Line
	3450 3100 3450 3150
Wire Wire Line
	5400 3050 5400 3000
$Comp
L cowdin-2-shutter:GND #PWR0108
U 1 1 5EC7FA57
P 5400 3050
F 0 "#PWR0108" H 5400 3050 30  0001 C CNN
F 1 "GND" H 5400 2980 30  0001 C CNN
F 2 "" H 5400 3050 60  0000 C CNN
F 3 "" H 5400 3050 60  0000 C CNN
	1    5400 3050
	1    0    0    -1  
$EndComp
Text GLabel 6150 2300 2    45   Output ~ 0
CAN0_TX
Text GLabel 6150 2400 2    45   Input ~ 0
CAN0_RX
Wire Wire Line
	6150 2300 6050 2300
Wire Wire Line
	6050 2400 6150 2400
Wire Wire Line
	3200 1000 3200 950 
Wire Wire Line
	3200 950  3300 950 
Wire Wire Line
	3300 950  3300 1000
Wire Wire Line
	3300 900  3300 950 
Connection ~ 3300 950 
Wire Wire Line
	3300 950  3400 950 
Wire Wire Line
	3400 950  3400 1000
$Comp
L cowdin-2-shutter:+5V #PWR0109
U 1 1 5ECA5B5B
P 3300 900
F 0 "#PWR0109" H 3300 860 30  0001 C CNN
F 1 "+5V" H 3309 1038 30  0000 C CNN
F 2 "" H 3300 900 60  0000 C CNN
F 3 "" H 3300 900 60  0000 C CNN
	1    3300 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1100 5300 1050
Wire Wire Line
	5300 1050 5350 1050
Wire Wire Line
	5400 1050 5400 1100
Wire Wire Line
	5350 1000 5350 1050
Connection ~ 5350 1050
Wire Wire Line
	5350 1050 5400 1050
$Comp
L cowdin-2-shutter:+5V #PWR0110
U 1 1 5ECAAC31
P 5350 1000
F 0 "#PWR0110" H 5350 960 30  0001 C CNN
F 1 "+5V" H 5359 1138 30  0000 C CNN
F 2 "" H 5350 1000 60  0000 C CNN
F 3 "" H 5350 1000 60  0000 C CNN
	1    5350 1000
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:C C9
U 1 1 5ECAB36D
P 5900 1000
F 0 "C9" V 5700 1000 60  0000 C CNN
F 1 "100nF" V 6050 1000 50  0000 C CNN
F 2 "cowdin-2-shutter:SMD0603" H 5900 1000 60  0001 C CNN
F 3 "" H 5900 1000 60  0000 C CNN
	1    5900 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 1000 5500 1000
Wire Wire Line
	5500 1000 5500 1100
Wire Wire Line
	6100 1000 6200 1000
Wire Wire Line
	6200 1000 6200 1100
$Comp
L cowdin-2-shutter:GND #PWR0111
U 1 1 5ECB0ECE
P 6200 1100
F 0 "#PWR0111" H 6200 1100 30  0001 C CNN
F 1 "GND" H 6200 1030 30  0001 C CNN
F 2 "" H 6200 1100 60  0000 C CNN
F 3 "" H 6200 1100 60  0000 C CNN
	1    6200 1100
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:MCP2562 U2
U 1 1 5ECC13F2
P 3300 4150
F 0 "U2" H 3000 4550 60  0000 C CNN
F 1 "MCP2562" H 3000 3750 60  0000 C CNN
F 2 "cowdin-2-shutter:SOIC-8E" H 3300 4150 60  0001 C CNN
F 3 "" H 3300 4150 60  0000 C CNN
	1    3300 4150
	-1   0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR0112
U 1 1 5ECC9A26
P 3300 4650
F 0 "#PWR0112" H 3300 4650 30  0001 C CNN
F 1 "GND" H 3300 4580 30  0001 C CNN
F 2 "" H 3300 4650 60  0000 C CNN
F 3 "" H 3300 4650 60  0000 C CNN
	1    3300 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4650 3300 4600
Text GLabel 2650 4050 0    45   BiDi ~ 0
CAN_H
Wire Wire Line
	2650 4050 2750 4050
Wire Wire Line
	2650 4250 2750 4250
Text GLabel 2650 4250 0    45   BiDi ~ 0
CAN_L
$Comp
L cowdin-2-shutter:+5V #PWR0113
U 1 1 5ECDEB4F
P 3200 3650
F 0 "#PWR0113" H 3200 3610 30  0001 C CNN
F 1 "+5V" H 3209 3788 30  0000 C CNN
F 2 "" H 3200 3650 60  0000 C CNN
F 3 "" H 3200 3650 60  0000 C CNN
	1    3200 3650
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:+5V #PWR0114
U 1 1 5ECDEBBF
P 3400 3650
F 0 "#PWR0114" H 3400 3610 30  0001 C CNN
F 1 "+5V" H 3409 3788 30  0000 C CNN
F 2 "" H 3400 3650 60  0000 C CNN
F 3 "" H 3400 3650 60  0000 C CNN
	1    3400 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3650 3400 3700
Wire Wire Line
	3200 3700 3200 3650
Text GLabel 1500 3450 2    50   BiDi ~ 0
CAN_H
Wire Wire Line
	1400 3550 1300 3550
Wire Wire Line
	1400 3150 1300 3150
Text GLabel 1500 3250 2    50   BiDi ~ 0
CAN_L
Wire Wire Line
	1500 3250 1400 3250
Wire Wire Line
	1400 3250 1400 3150
Wire Wire Line
	1500 3450 1400 3450
Wire Wire Line
	1400 3450 1400 3550
$Comp
L cowdin-2-shutter:R R10
U 1 1 5ECF28DC
P 3950 4700
F 0 "R10" V 4050 4700 50  0000 C CNN
F 1 "10k" V 3950 4700 45  0000 C CNN
F 2 "cowdin-2-shutter:SMD0603" H 3950 4700 60  0001 C CNN
F 3 "" H 3950 4700 60  0000 C CNN
	1    3950 4700
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR0115
U 1 1 5ECF2AA4
P 3950 5000
F 0 "#PWR0115" H 3950 5000 30  0001 C CNN
F 1 "GND" H 3950 4930 30  0001 C CNN
F 2 "" H 3950 5000 60  0000 C CNN
F 3 "" H 3950 5000 60  0000 C CNN
	1    3950 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5000 3950 4950
Wire Wire Line
	3850 4350 3950 4350
Wire Wire Line
	3950 4350 3950 4450
$Comp
L cowdin-2-shutter:C C8
U 1 1 5ECFE5D4
P 4900 7250
F 0 "C8" H 4950 7350 50  0000 L CNN
F 1 "100nF" H 4950 7150 50  0000 L CNN
F 2 "cowdin-2-shutter:SMD0603" H 4900 7250 60  0001 C CNN
F 3 "" H 4900 7250 60  0000 C CNN
	1    4900 7250
	1    0    0    -1  
$EndComp
$Comp
L cowdin-2-shutter:+5V #PWR0116
U 1 1 5ECFE864
P 4000 6950
F 0 "#PWR0116" H 4000 6910 30  0001 C CNN
F 1 "+5V" H 4009 7088 30  0000 C CNN
F 2 "" H 4000 6950 60  0000 C CNN
F 3 "" H 4000 6950 60  0000 C CNN
	1    4000 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 6950 4000 7000
Wire Wire Line
	4000 7550 4000 7450
$Comp
L cowdin-2-shutter:GND #PWR0117
U 1 1 5ED0626D
P 4000 7550
F 0 "#PWR0117" H 4000 7550 30  0001 C CNN
F 1 "GND" H 4000 7480 30  0001 C CNN
F 2 "" H 4000 7550 60  0000 C CNN
F 3 "" H 4000 7550 60  0000 C CNN
	1    4000 7550
	1    0    0    -1  
$EndComp
Text GLabel 3950 4000 2    50   Input ~ 0
CAN0_TX
Text GLabel 3950 4150 2    50   Output ~ 0
CAN0_RX
Wire Wire Line
	3950 4000 3850 4000
Wire Wire Line
	3850 4150 3950 4150
$Comp
L cowdin-2-shutter:C C7
U 1 1 5ED0E9AC
P 4600 7250
F 0 "C7" H 4650 7350 50  0000 L CNN
F 1 "100nF" H 4650 7150 50  0000 L CNN
F 2 "cowdin-2-shutter:SMD0603" H 4600 7250 60  0001 C CNN
F 3 "" H 4600 7250 60  0000 C CNN
	1    4600 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 7050 4300 7000
Wire Wire Line
	4300 7000 4000 7000
Connection ~ 4000 7000
Wire Wire Line
	4000 7000 4000 7050
$Comp
L cowdin-2-shutter:GND #PWR0118
U 1 1 5ED12E81
P 4300 7550
F 0 "#PWR0118" H 4300 7550 30  0001 C CNN
F 1 "GND" H 4300 7480 30  0001 C CNN
F 2 "" H 4300 7550 60  0000 C CNN
F 3 "" H 4300 7550 60  0000 C CNN
	1    4300 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 7550 4300 7450
Text GLabel 4650 1350 0    45   Input ~ 0
RESET
Wire Wire Line
	4650 1350 4750 1350
$Comp
L cowdin-2-shutter:C C1
U 1 1 5ED2448F
P 6150 6050
F 0 "C1" V 6050 5900 50  0000 C CNN
F 1 "1uF" V 6250 5900 50  0000 C CNN
F 2 "cowdin-2-shutter:SMD0603" H 6150 6050 60  0001 C CNN
F 3 "" H 6150 6050 60  0000 C CNN
	1    6150 6050
	0    1    1    0   
$EndComp
$Comp
L cowdin-2-shutter:GND #PWR0119
U 1 1 5ED247EA
P 5800 6200
F 0 "#PWR0119" H 5800 6200 30  0001 C CNN
F 1 "GND" H 5800 6130 30  0001 C CNN
F 2 "" H 5800 6200 60  0000 C CNN
F 3 "" H 5800 6200 60  0000 C CNN
	1    5800 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 6200 5800 6050
Wire Wire Line
	5800 6050 5950 6050
$Comp
L cowdin-2-shutter:R R1
U 1 1 5ED28FA8
P 6150 5750
F 0 "R1" V 6050 5750 50  0000 C CNN
F 1 "10k" V 6150 5750 45  0000 C CNN
F 2 "cowdin-2-shutter:SMD0603" H 6150 5750 60  0001 C CNN
F 3 "" H 6150 5750 60  0000 C CNN
	1    6150 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 5750 6500 5750
Wire Wire Line
	6500 5750 6500 5900
Wire Wire Line
	6500 6050 6350 6050
Wire Wire Line
	5800 5750 5900 5750
$Comp
L cowdin-2-shutter:+5V #PWR0120
U 1 1 5ED32AFF
P 5800 5600
F 0 "#PWR0120" H 5800 5560 30  0001 C CNN
F 1 "+5V" H 5809 5738 30  0000 C CNN
F 2 "" H 5800 5600 60  0000 C CNN
F 3 "" H 5800 5600 60  0000 C CNN
	1    5800 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 5600 5800 5750
Wire Wire Line
	6600 5900 6500 5900
Connection ~ 6500 5900
Wire Wire Line
	6500 5900 6500 6050
Text GLabel 6600 5900 2    50   Output ~ 0
RESET
Wire Notes Line
	800  5300 800  7750
Wire Notes Line
	800  7750 5450 7750
Wire Notes Line
	5450 7750 5450 5300
Wire Notes Line
	5450 5300 800  5300
Text Notes 4500 5500 0    80   ~ 0
Power Supply
Wire Notes Line
	5650 5300 5650 6450
Wire Notes Line
	6950 6450 6950 5300
Wire Notes Line
	6950 5300 5650 5300
Wire Notes Line
	6950 6450 5650 6450
Text Notes 6500 5500 0    80   ~ 0
Reset
$Comp
L cowdin-2-shutter:C C6
U 1 1 5ED7A519
P 4300 7250
F 0 "C6" H 4350 7350 50  0000 L CNN
F 1 "100nF" H 4350 7150 50  0000 L CNN
F 2 "cowdin-2-shutter:SMD0603" H 4300 7250 60  0001 C CNN
F 3 "" H 4300 7250 60  0000 C CNN
	1    4300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 7000 4600 7000
Wire Wire Line
	4600 7000 4600 7050
Connection ~ 4300 7000
Wire Wire Line
	4600 7550 4600 7450
$Comp
L cowdin-2-shutter:GND #PWR0121
U 1 1 5ED83ECC
P 4600 7550
F 0 "#PWR0121" H 4600 7550 30  0001 C CNN
F 1 "GND" H 4600 7480 30  0001 C CNN
F 2 "" H 4600 7550 60  0000 C CNN
F 3 "" H 4600 7550 60  0000 C CNN
	1    4600 7550
	1    0    0    -1  
$EndComp
Wire Notes Line
	2300 5100 2300 3450
Text Notes 4550 3650 0    80   ~ 0
CAN
$Comp
L cowdin-2-shutter:C C2
U 1 1 5ED8951C
P 4400 4700
F 0 "C2" H 4450 4800 50  0000 L CNN
F 1 "100nF" H 4450 4600 50  0000 L CNN
F 2 "cowdin-2-shutter:SMD0603" H 4400 4700 60  0001 C CNN
F 3 "" H 4400 4700 60  0000 C CNN
	1    4400 4700
	1    0    0    -1  
$EndComp
Wire Notes Line
	4900 5100 4900 3450
Wire Notes Line
	2300 5100 4900 5100
Wire Notes Line
	2300 3450 4900 3450
$Comp
L cowdin-2-shutter:GND #PWR0122
U 1 1 5ED8E374
P 4400 5000
F 0 "#PWR0122" H 4400 5000 30  0001 C CNN
F 1 "GND" H 4400 4930 30  0001 C CNN
F 2 "" H 4400 5000 60  0000 C CNN
F 3 "" H 4400 5000 60  0000 C CNN
	1    4400 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5000 4400 4900
Wire Wire Line
	4400 4450 4400 4500
$Comp
L cowdin-2-shutter:+5V #PWR0123
U 1 1 5ED9804E
P 4400 4450
F 0 "#PWR0123" H 4400 4410 30  0001 C CNN
F 1 "+5V" H 4409 4588 30  0000 C CNN
F 2 "" H 4400 4450 60  0000 C CNN
F 3 "" H 4400 4450 60  0000 C CNN
	1    4400 4450
	1    0    0    -1  
$EndComp
Text GLabel 3950 2700 2    45   Input ~ 0
SWD_CLK
Text GLabel 3950 2800 2    45   BiDi ~ 0
SWD_DAT
Wire Wire Line
	3950 2700 3850 2700
Wire Wire Line
	3850 2800 3950 2800
Wire Wire Line
	4500 5900 4700 5900
Wire Wire Line
	4550 6350 4700 6350
Wire Wire Line
	4700 6350 4700 5900
Connection ~ 4700 5900
Wire Wire Line
	4700 5900 5000 5900
Wire Wire Line
	4050 6650 4000 6650
Wire Wire Line
	4000 6650 4000 6500
Wire Wire Line
	4000 6350 4050 6350
Wire Wire Line
	4700 6650 4550 6650
Wire Wire Line
	4700 6650 4700 6750
Wire Wire Line
	4000 6500 3600 6500
Connection ~ 4000 6500
Wire Wire Line
	4000 6500 4000 6350
$Comp
L cowdin-2-shutter:C C5
U 1 1 5EDFF51D
P 4000 7250
F 0 "C5" H 4050 7350 50  0000 L CNN
F 1 "100nF" H 4050 7150 50  0000 L CNN
F 2 "cowdin-2-shutter:SMD0603" H 4000 7250 60  0001 C CNN
F 3 "" H 4000 7250 60  0000 C CNN
	1    4000 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 7000 4900 7000
Wire Wire Line
	4900 7000 4900 7050
Connection ~ 4600 7000
Wire Wire Line
	4900 7550 4900 7450
$Comp
L cowdin-2-shutter:GND #PWR0124
U 1 1 5EE0A7A7
P 4900 7550
F 0 "#PWR0124" H 4900 7550 30  0001 C CNN
F 1 "GND" H 4900 7480 30  0001 C CNN
F 2 "" H 4900 7550 60  0000 C CNN
F 3 "" H 4900 7550 60  0000 C CNN
	1    4900 7550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
