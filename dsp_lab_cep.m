close all
clc
%%
%seting the frequency and waveform %
f=2*1000;
fs=4500; %sampling rate %according to nyquist theorm
d=30; %duration of sample
n=fs*d;
t=(1:n)/fs;
y1=cos(2*pi*f*t);
%%
% generate sound %

tone='song_2khz_.wav';
audiowrite(tone,y1,fs);
%sound(y,fs);
%%
% read sample %
% 
load handel.mat;
% y=audioread('C:\Users\toshiba\Downloads\Music\Sample1.wav');
y2= y;
MinimumLength = min([length(y1), length(y2)]);
y1 = y1(1:MinimumLength);
y2 = y2(1:MinimumLength);
y2_trans=transpose(y2);
y3 = y1+y2_trans;
% sound(y3,fs);
% mix = y+y1;
y3_fft=fft(y3,fs);
figure(1)
plot(abs(y3_fft))
xlabel('Frequency in Hz');
ylabel('Magnitude');
title('Corrupted Signal in frequency domain');
%%
%i.	simple pole-zero approach Filter%
% fs = 20000;             % sampling rate
f0 = 2000;                % notch frequency
fn = fs/2;              % Nyquist frequency
freqRatio = f0/fn;      % ratio of notch freq. to Nyquist freq.

notchWidth = 0.1;       % width of the notch

% Compute zeros
notchZeros = [exp( sqrt(-1)*pi*freqRatio ), exp( -sqrt(-1)*pi*freqRatio )];

% Compute poles
notchPoles = (1-notchWidth) * notchZeros;

figure;
zplane(notchZeros.', notchPoles.');

b = poly( notchZeros ); %  Get moving average filter coefficients
a = poly( notchPoles ); %  Get autoregressive filter coefficients

figure;
freqz(b,a,32000,fs)
out1 = filter(b,a,y3);
%%
%Play and Write Sound%
% sound(out1,fs); %Play sound
pole_zero='song_through_pole_zero.wav';
audiowrite(pole_zero,out1,fs);
out_fft=fft(out1,fs);
figure;
plot(abs(out_fft));
xlabel('Frequency in Hz');
ylabel('Magnitude');
title('Notch Filter Filter Signal in frequency domain');
%%
%Band Stop Filter Implementation%

notch_bandstop=filter(bandstop,y3);
%%
%Play and Write Sound%
%sound(notch_bandstop,fs); %Play sound
band_stop='song_through_butterworth.wav';
audiowrite(band_stop,notch_bandstop,fs);
%%
%Fourier Transform of Band Stop Filter %
P=fft(notch_bandstop,fs);
figure;
plot(abs(P));
xlabel('Frequency in Hz');
ylabel('Magnitude');
title('Band Stop Filter Signal in frequency domain');

%%
%Parallel Filter Implementation%
low_pass=filter(lowpass,y3);
high_pass=filter(highpass,y3);
parallel_filter=low_pass+high_pass;
%%
%Play and Write Sound%
%sound(parallel_filter,fs); %Play sound
parallel_filter_file='song_through_parallel_butterworth.wav';
audiowrite(parallel_filter_file,parallel_filter,fs);
%%
%Fourier Transform of Parallel Filter %
parallel_fft=fft(parallel_filter,fs);
figure;
plot(abs(parallel_fft));
xlabel('Frequency in Hz');
ylabel('Magnitude');
title('Filtered Signal in frequency domain');
%%
%%END OF PROGRAM&&
%%

