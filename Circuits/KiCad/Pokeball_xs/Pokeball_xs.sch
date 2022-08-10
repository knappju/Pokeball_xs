EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PIC12LF1571T-I-SN:PIC12LF1571T-I_SN U1
U 1 1 62F19D25
P 2650 4200
F 0 "U1" H 4150 4587 60  0000 C CNN
F 1 "PIC12LF1571T-I_SN" H 4150 4481 60  0000 C CNN
F 2 "PIC12LF1571T-I_SN:PIC12LF1571T-I&slash_SN" H 4150 4440 60  0001 C CNN
F 3 "" H 2650 4200 60  0000 C CNN
	1    2650 4200
	1    0    0    -1  
$EndComp
$Comp
L MCP1754ST-3302E-DB:MCP1754ST-3302E_DB U2
U 1 1 62F1CF91
P 2950 1200
F 0 "U2" H 3750 1587 60  0000 C CNN
F 1 "MCP1754ST-3302E_DB" H 3750 1481 60  0000 C CNN
F 2 "MCP1754ST-3302E_DB:MCP1754ST-3302E&slash_DB" H 3750 1440 60  0001 C CNN
F 3 "" H 2950 1200 60  0000 C CNN
	1    2950 1200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 62F1ECFA
P 1900 6600
F 0 "J1" H 1818 7017 50  0000 C CNN
F 1 "Conn_01x05" H 1818 6926 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x05_P1.00mm_Vertical" H 1900 6600 50  0001 C CNN
F 3 "~" H 1900 6600 50  0001 C CNN
	1    1900 6600
	-1   0    0    -1  
$EndComp
Text GLabel 2400 6400 2    50   Output ~ 0
Vcc
Text GLabel 2400 6500 2    50   Output ~ 0
MCLR
Text GLabel 2400 6600 2    50   Output ~ 0
PGD
Text GLabel 2400 6700 2    50   Output ~ 0
PGC
$Comp
L power:GND #PWR0101
U 1 1 62F25654
P 2400 6800
F 0 "#PWR0101" H 2400 6550 50  0001 C CNN
F 1 "GND" H 2405 6627 50  0000 C CNN
F 2 "" H 2400 6800 50  0001 C CNN
F 3 "" H 2400 6800 50  0001 C CNN
	1    2400 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 6400 2400 6400
Wire Wire Line
	2100 6500 2400 6500
Wire Wire Line
	2100 6600 2400 6600
Wire Wire Line
	2100 6700 2400 6700
Wire Wire Line
	2100 6800 2400 6800
$Comp
L power:GND #PWR0102
U 1 1 62F28736
P 3250 6900
F 0 "#PWR0102" H 3250 6650 50  0001 C CNN
F 1 "GND" H 3255 6727 50  0000 C CNN
F 2 "" H 3250 6900 50  0001 C CNN
F 3 "" H 3250 6900 50  0001 C CNN
	1    3250 6900
	1    0    0    -1  
$EndComp
Text GLabel 3250 6250 1    50   Input ~ 0
Vcc
$Comp
L Device:R_Small_US R1
U 1 1 62F2A2AA
P 3250 6400
F 0 "R1" H 3318 6446 50  0000 L CNN
F 1 "4.7k" H 3318 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3250 6400 50  0001 C CNN
F 3 "~" H 3250 6400 50  0001 C CNN
	1    3250 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R2
U 1 1 62F2C7CA
P 3700 6600
F 0 "R2" V 3600 6550 50  0000 L CNN
F 1 "100" V 3500 6500 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3700 6600 50  0001 C CNN
F 3 "~" H 3700 6600 50  0001 C CNN
	1    3700 6600
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP1_Small C1
U 1 1 62F2D3C4
P 3250 6750
F 0 "C1" H 3341 6796 50  0000 L CNN
F 1 "0.1uF" H 3341 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3250 6750 50  0001 C CNN
F 3 "~" H 3250 6750 50  0001 C CNN
	1    3250 6750
	1    0    0    -1  
$EndComp
Text GLabel 3900 6600 2    50   BiDi ~ 0
MCLR
Wire Wire Line
	3250 6250 3250 6300
Wire Wire Line
	3250 6500 3250 6600
Wire Wire Line
	3250 6850 3250 6900
Wire Wire Line
	3250 6600 3600 6600
Connection ~ 3250 6600
Wire Wire Line
	3250 6600 3250 6650
Wire Wire Line
	3800 6600 3900 6600
Text GLabel 2450 4500 0    50   BiDi ~ 0
MCLR
Wire Wire Line
	2450 4500 2650 4500
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 62F3580D
P 1600 1200
F 0 "J2" H 1518 1417 50  0000 C CNN
F 1 "Conn_01x02" H 1518 1326 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x02_P1.00mm_Vertical" H 1600 1200 50  0001 C CNN
F 3 "~" H 1600 1200 50  0001 C CNN
	1    1600 1200
	-1   0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 62F3FA1B
P 9250 1250
F 0 "H1" H 9350 1296 50  0000 L CNN
F 1 "MountingHole" H 9350 1205 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 9250 1250 50  0001 C CNN
F 3 "~" H 9250 1250 50  0001 C CNN
	1    9250 1250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 62F41463
P 9250 1500
F 0 "H2" H 9350 1546 50  0000 L CNN
F 1 "MountingHole" H 9350 1455 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 9250 1500 50  0001 C CNN
F 3 "~" H 9250 1500 50  0001 C CNN
	1    9250 1500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 62F420FF
P 9250 1750
F 0 "H3" H 9350 1796 50  0000 L CNN
F 1 "MountingHole" H 9350 1705 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 9250 1750 50  0001 C CNN
F 3 "~" H 9250 1750 50  0001 C CNN
	1    9250 1750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 62F42105
P 9250 2000
F 0 "H4" H 9350 2046 50  0000 L CNN
F 1 "MountingHole" H 9350 1955 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 9250 2000 50  0001 C CNN
F 3 "~" H 9250 2000 50  0001 C CNN
	1    9250 2000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J3
U 1 1 62F4A7E5
P 9350 3500
F 0 "J3" H 9430 3492 50  0000 L CNN
F 1 "Conn_01x06" H 9430 3401 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x06_P1.00mm_Vertical" H 9350 3500 50  0001 C CNN
F 3 "~" H 9350 3500 50  0001 C CNN
	1    9350 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R3
U 1 1 62F4C93F
P 8550 2900
F 0 "R3" V 8345 2900 50  0000 C CNN
F 1 "56" V 8436 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8550 2900 50  0001 C CNN
F 3 "~" H 8550 2900 50  0001 C CNN
	1    8550 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R4
U 1 1 62F4DBF8
P 8550 3200
F 0 "R4" V 8345 3200 50  0000 C CNN
F 1 "24" V 8436 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8550 3200 50  0001 C CNN
F 3 "~" H 8550 3200 50  0001 C CNN
	1    8550 3200
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R5
U 1 1 62F4E098
P 8550 3500
F 0 "R5" V 8345 3500 50  0000 C CNN
F 1 "24" V 8436 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8550 3500 50  0001 C CNN
F 3 "~" H 8550 3500 50  0001 C CNN
	1    8550 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	8650 3500 9150 3500
Wire Wire Line
	8650 3200 8800 3200
Wire Wire Line
	8800 3200 8800 3400
Wire Wire Line
	8800 3400 9150 3400
Wire Wire Line
	8650 2900 8900 2900
Wire Wire Line
	8900 2900 8900 3300
Wire Wire Line
	8900 3300 9150 3300
Text GLabel 8100 2900 0    50   Input ~ 0
PWM_1_RED
Text GLabel 8100 3200 0    50   Input ~ 0
PWM_2_GREEN
Text GLabel 8100 3500 0    50   Input ~ 0
PWM_3_BLUE
$Comp
L Device:CP1_Small C5
U 1 1 62F55B37
P 5450 1300
F 0 "C5" H 5541 1346 50  0000 L CNN
F 1 "1uF 10v" H 5541 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5450 1300 50  0001 C CNN
F 3 "~" H 5450 1300 50  0001 C CNN
	1    5450 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C4
U 1 1 62F55FBB
P 4900 1300
F 0 "C4" H 4991 1346 50  0000 L CNN
F 1 "100uF 10v" H 4991 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4900 1300 50  0001 C CNN
F 3 "~" H 4900 1300 50  0001 C CNN
	1    4900 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C3
U 1 1 62F599DF
P 2700 1300
F 0 "C3" H 2791 1346 50  0000 L CNN
F 1 "0.1uF 10v" H 2791 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2700 1300 50  0001 C CNN
F 3 "~" H 2700 1300 50  0001 C CNN
	1    2700 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C2
U 1 1 62F599E5
P 2150 1300
F 0 "C2" H 2241 1346 50  0000 L CNN
F 1 "10uF 10v" H 2241 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2150 1300 50  0001 C CNN
F 3 "~" H 2150 1300 50  0001 C CNN
	1    2150 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1200 2150 1200
Wire Wire Line
	2150 1200 2700 1200
Connection ~ 2150 1200
Wire Wire Line
	2700 1200 2950 1200
Connection ~ 2700 1200
Wire Wire Line
	1800 1300 2000 1300
Wire Wire Line
	2000 1300 2000 1400
Wire Wire Line
	2000 1400 2150 1400
Wire Wire Line
	2150 1400 2700 1400
Connection ~ 2150 1400
$Comp
L power:GND #PWR0103
U 1 1 62F5D8A8
P 2700 1650
F 0 "#PWR0103" H 2700 1400 50  0001 C CNN
F 1 "GND" H 2705 1477 50  0000 C CNN
F 2 "" H 2700 1650 50  0001 C CNN
F 3 "" H 2700 1650 50  0001 C CNN
	1    2700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1400 2700 1650
Connection ~ 2700 1400
Wire Wire Line
	4550 1200 4900 1200
Wire Wire Line
	4900 1200 5450 1200
Connection ~ 4900 1200
Wire Wire Line
	4550 1300 4700 1300
Wire Wire Line
	4700 1300 4700 1400
Wire Wire Line
	4700 1400 4900 1400
Wire Wire Line
	4900 1400 5450 1400
Connection ~ 4900 1400
$Comp
L power:GND #PWR0104
U 1 1 62F61BD0
P 4900 1550
F 0 "#PWR0104" H 4900 1300 50  0001 C CNN
F 1 "GND" H 4905 1377 50  0000 C CNN
F 2 "" H 4900 1550 50  0001 C CNN
F 3 "" H 4900 1550 50  0001 C CNN
	1    4900 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1400 4900 1550
Text GLabel 5950 1200 2    50   Output ~ 0
Vcc
Wire Wire Line
	5450 1200 5950 1200
Connection ~ 5450 1200
$Comp
L power:GND #PWR0105
U 1 1 62F6CA5F
P 5750 4050
F 0 "#PWR0105" H 5750 3800 50  0001 C CNN
F 1 "GND" H 5755 3877 50  0000 C CNN
F 2 "" H 5750 4050 50  0001 C CNN
F 3 "" H 5750 4050 50  0001 C CNN
	1    5750 4050
	1    0    0    1   
$EndComp
Text GLabel 2450 4200 0    50   Input ~ 0
Vcc
Wire Wire Line
	2450 4200 2650 4200
Wire Wire Line
	5650 4200 5750 4200
Wire Wire Line
	5750 4200 5750 4050
Text GLabel 5900 4000 1    50   Input ~ 0
PGD
Text GLabel 6000 4000 1    50   Input ~ 0
PGC
Wire Wire Line
	5900 4000 5900 4300
Wire Wire Line
	5900 4300 5650 4300
Wire Wire Line
	6000 4400 5650 4400
Wire Wire Line
	6000 4000 6000 4400
Text GLabel 2450 4300 0    50   Input ~ 0
PWM_1_RED
Text GLabel 2450 4400 0    50   Input ~ 0
PWM_2_GREEN
Text GLabel 6400 4500 2    50   Input ~ 0
PWM_3_BLUE
Wire Wire Line
	5650 4500 6400 4500
Wire Wire Line
	2450 4300 2650 4300
Wire Wire Line
	2450 4400 2650 4400
Wire Wire Line
	8100 2900 8450 2900
Wire Wire Line
	8100 3200 8450 3200
Wire Wire Line
	8100 3500 8450 3500
$Comp
L power:GND #PWR0106
U 1 1 62FA583A
P 8800 4350
F 0 "#PWR0106" H 8800 4100 50  0001 C CNN
F 1 "GND" H 8805 4177 50  0000 C CNN
F 2 "" H 8800 4350 50  0001 C CNN
F 3 "" H 8800 4350 50  0001 C CNN
	1    8800 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 4350 8800 3800
Wire Wire Line
	8800 3600 9150 3600
Wire Wire Line
	9150 3800 8800 3800
Connection ~ 8800 3800
Wire Wire Line
	8800 3800 8800 3600
Text GLabel 6400 4300 2    50   Input ~ 0
btn_in
Wire Wire Line
	5900 4300 6400 4300
Connection ~ 5900 4300
Text GLabel 7750 3700 0    50   Input ~ 0
btn_in
Text GLabel 7750 3950 0    50   Input ~ 0
Vcc
$Comp
L Device:R_Small_US R7
U 1 1 62FAF3B7
P 8300 3800
F 0 "R7" H 8100 3750 50  0000 L CNN
F 1 "4.7k" H 8050 3850 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8300 3800 50  0001 C CNN
F 3 "~" H 8300 3800 50  0001 C CNN
	1    8300 3800
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small_US R6
U 1 1 62FBB999
P 8000 3700
F 0 "R6" V 8100 3550 50  0000 C CNN
F 1 "100" V 8100 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8000 3700 50  0001 C CNN
F 3 "~" H 8000 3700 50  0001 C CNN
	1    8000 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 3700 7900 3700
Wire Wire Line
	8100 3700 8300 3700
Wire Wire Line
	8300 3700 9150 3700
Connection ~ 8300 3700
Wire Wire Line
	8300 3950 8300 3900
Wire Wire Line
	7750 3950 8300 3950
$EndSCHEMATC