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
L Connector:USB_C_Plug P?
U 1 1 61857CA9
P 2800 2700
F 0 "P?" H 2907 3967 50  0000 C CNN
F 1 "USB_C_Plug" H 2907 3876 50  0000 C CNN
F 2 "" H 2950 2700 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 2950 2700 50  0001 C CNN
	1    2800 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_C_Plug P?
U 1 1 618659FA
P 2750 5700
F 0 "P?" H 2857 6967 50  0000 C CNN
F 1 "USB_C_Plug" H 2857 6876 50  0000 C CNN
F 2 "" H 2900 5700 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 2900 5700 50  0001 C CNN
	1    2750 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_C_Plug P?
U 1 1 61867B34
P 1250 5650
F 0 "P?" H 1357 6917 50  0000 C CNN
F 1 "USB_C_Plug" H 1357 6826 50  0000 C CNN
F 2 "" H 1400 5650 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1400 5650 50  0001 C CNN
	1    1250 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_C_Plug P?
U 1 1 61869704
P 1250 2700
F 0 "P?" H 1357 3967 50  0000 C CNN
F 1 "USB_C_Plug" H 1357 3876 50  0000 C CNN
F 2 "" H 1400 2700 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1400 2700 50  0001 C CNN
	1    1250 2700
	1    0    0    -1  
$EndComp
$Comp
L USB7206CT_Func:USB7206CT_KDX U?
U 1 1 61881E76
P 5000 1150
F 0 "U?" H 7200 1637 60  0000 C CNN
F 1 "USB7206CT_KDX" H 7200 1531 60  0000 C CNN
F 2 "VQFN100_KDX_MCH" H 7200 1490 60  0001 C CNN
F 3 "" H 5000 1150 60  0000 C CNN
	1    5000 1150
	1    0    0    -1  
$EndComp
$Comp
L USB7206CT_Func:USB7206CT_KDX U?
U 2 1 6188DAF2
P 3750 5200
F 0 "U?" H 5078 4153 60  0000 L CNN
F 1 "USB7206CT_KDX" H 5078 4047 60  0000 L CNN
F 2 "VQFN100_KDX_MCH" H 5950 5540 60  0001 C CNN
F 3 "" H 3750 5200 60  0000 C CNN
	2    3750 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 5700 3600 5700
Wire Wire Line
	3600 5700 3600 1700
Wire Wire Line
	3600 1700 3400 1700
Wire Wire Line
	3750 5800 3500 5800
Wire Wire Line
	3500 5800 3500 1350
Wire Wire Line
	3500 1350 1850 1350
Wire Wire Line
	1850 1350 1850 1700
Wire Wire Line
	3750 5900 3450 5900
Wire Wire Line
	3450 5900 3450 4400
Wire Wire Line
	3450 4400 1850 4400
Wire Wire Line
	1850 4400 1850 4650
Wire Wire Line
	9400 3650 10050 3650
Wire Wire Line
	10050 3650 10050 800 
Wire Wire Line
	10050 800  3950 800 
Wire Wire Line
	3950 800  3950 3100
Wire Wire Line
	3950 3100 3400 3100
Wire Wire Line
	9400 3750 10100 3750
Wire Wire Line
	10100 3750 10100 750 
Wire Wire Line
	10100 750  4000 750 
Wire Wire Line
	4000 750  4000 3000
Wire Wire Line
	4000 3000 3400 3000
Wire Wire Line
	9400 3850 10150 3850
Wire Wire Line
	10150 3850 10150 700 
Wire Wire Line
	10150 700  4100 700 
Wire Wire Line
	4100 700  4100 2800
Wire Wire Line
	4100 2800 3400 2800
Wire Wire Line
	10200 3950 10200 650 
Wire Wire Line
	10200 650  4050 650 
Wire Wire Line
	4050 650  4050 2700
Wire Wire Line
	4050 2700 3400 2700
Wire Wire Line
	9400 3950 10200 3950
Wire Wire Line
	5000 3450 4550 3450
Wire Wire Line
	4550 3450 4550 2400
Wire Wire Line
	4550 2400 3400 2400
Wire Wire Line
	5000 3550 4500 3550
Wire Wire Line
	4500 3550 4500 2200
Wire Wire Line
	4500 2200 3400 2200
$EndSCHEMATC
