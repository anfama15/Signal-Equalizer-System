# DSP_CEA
Corrupt an audio Signal with 2khz noise and use various filtering techniques to filter it.

1.	NOTCH FILTER POLE ZERO APPROACH:
Every digital filter can be specified by its poles and zeros (together with a gain factor). Poles and zeros give useful insights into a filter's response, and can be used as the basis for digital filter design.[1]

2.	BANDSTOP BUTTERWORTH FILTER: 
A Band Stop Filter, also sometimes called a notch or band reject filter allows a specific range of frequencies to not pass to the output, while allowing lower and higher frequencies to pass with little attenuation and The Butterworth filter is a type of signal processing filter designed to have a frequency response that is as flat as possible in the passband. It is also referred to as a maximally flat magnitude filter.[4]

3.	LOWPASS BUTTERWORTH FILTER: 
The low pass Butterworth filter is an active Low pass filter as it consists of the op-amp. This op-amp operates on non-inverting mode. Hence, the gain of the filter will decide by the resistor R1 and RF. And the cutoff frequency decides by R and C .

4.	HIGH PASS BUTTERWORTH FILTER:
The high pass Butterworth filter is an active high pass filter as it consists of the op-amp. This op-amp operates on non-inverting mode. Hence, the gain of the filter will decide by the resistor R1 and RF. And the cutoff frequency decides by R and C.[2]

ADVANTAGES OF NOTCH FILTER: 
•	Notch filters can be useful on the command for a fixed-frequency noise source such as that from line frequency (50 or 60 Hz) noise. 
•	Notch filters are also used to remove resonances from the system. 
•	Both notch and low-pass filters can cure resonance. 
•	Notch filters do so while creating less phase lag in the control loop.
 DISADVANTAGES OF NOTCH FILTER: 
•	The drawback of notch filters is that they are not effective if the resonant frequencies change significantly. 
•	Changes in resonant frequency can be caused by changes in load inertia.
•	For example, in a dispensing application, the load changes as the product is dispensed. 
