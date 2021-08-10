% PROJECT 
% COMPARISION OF OCTAVES

[y,fs]      = audioread('HAIR DRYER WITHOUT CASING.wav');  % Upload Your sound file here.
t           = linspace(0,length(y)/fs,length(y)); % Averaging Time
Sensitivity = 0.2105;  % Sensitivity of CellPhone
y1          = y(:,1)*Sensitivity;   % For Singal Channel

% figure(1)
% %subplot(2,2,1)
% plot(t,y1)
% xlabel('Time(Seconds)');
% ylabel('Pressure(Pa)');
% title('Pressure v/s Time Plot')
Pref = 20e-6; % Reference Pressure

%% Pressure v/s Frequency Graph
L          = length(y1);
ffty1      = fft(y1);
P2         = abs(ffty1/L);
P1         = 2*P2;
P          = P2(1:L/2+1);
P(2:end-1) = 2*P(2:end-1);
f = fs*(0:(L/2))/L;



%% 1/3 Octave Band Bar Graph & Calculation
fq3  = [12.5 16 20 25 31.5 40 50 63 80 100 ...
       125 160 200 250 315 400 500 630 800 1000 1250 ...
       1600 2000 2500 3150 4000 5000 6300 8000 10000 ...
       12500 16000 20000];
% Octave Bands lower and and upper frequency vector 
oct3 = zeros(1,length(fq3)-1);
for i = 1:length(fq3)-1
    ylp = ffty1;
    ylp(f>fq3(i+1) & f<fs-fq3(i+1)) = 0;
    ylp(f<=fq3(i) & f<=fs-fq3(i)) = 0;
    ylp = ifft(ylp,'symmetric');
    oct3(i) = 20*log10(rms(ylp)/Pref); 
end
SPL_Octave_Band_Third = oct3;% Getting 1/3 Octave Band Vector
Octave_Bands_Third = [12.5;16;20;25;31.5;40;50;63;80;100;
                      125;160;200;250;315;400;500;630;800;
                      1000;1250;1600;2000;2500;3150;4000;5000;
                      6300;8000;10000;12500;16000];
% Central frequency of 1/1 Octave Bands
n2 = length(Octave_Bands_Third);
for j = 1:n2
    if SPL_Octave_Band_Third(j)<0
       SPL_Octave_Band_Third(j) = 0;
    end
end

bar(categorical(Octave_Bands_Third),SPL_Octave_Band_Third,'r');
hold on
title('1/3 Octave Bands')
xlabel('Central Frequency(Hz)');
ylabel('SPL(dB)');
% Bar Graph for easy representation of 1/3 octave bands


[z,fs]      = audioread('HAIR DRYER WITH MUFFLER.wav');  % Upload Your sound file here.
T           = linspace(0,length(z)/fs,length(z)); % Averaging Time
Sensitivity = 0.2105;  % Sensitivity of CellPhone
z1          = z(:,1)*Sensitivity;   % For Singal Channel

% figure(1)
% %subplot(2,2,1)
% plot(t,y1)
% xlabel('Time(Seconds)');
% ylabel('Pressure(Pa)');
% title('Pressure v/s Time Plot')
Pref = 20e-6; % Reference Pressure

%% Pressure v/s Frequency Graph
L          = length(z1);
fftz1      = fft(z1);
P2         = abs(fftz1/L);
P1         = 2*P2;
P          = P2(1:L/2+1);
P(2:end-1) = 2*P(2:end-1);
f = fs*(0:(L/2))/L;



%% 1/3 Octave Band Bar Graph & Calculation
fq3  = [12.5 16 20 25 31.5 40 50 63 80 100 ...
       125 160 200 250 315 400 500 630 800 1000 1250 ...
       1600 2000 2500 3150 4000 5000 6300 8000 10000 ...
       12500 16000 20000];
% Octave Bands lower and and upper frequency vector 
oct3 = zeros(1,length(fq3)-1);
for i = 1:length(fq3)-1
    zlp = fftz1;
    zlp(f>fq3(i+1) & f<fs-fq3(i+1)) = 0;
    zlp(f<=fq3(i) & f<=fs-fq3(i)) = 0;
    zlp = ifft(zlp,'symmetric');
    oct3(i) = 20*log10(rms(zlp)/Pref); 
end
SPL_Octave_Band_Third = oct3;% Getting 1/3 Octave Band Vector
Octave_Bands_Third = [12.5;16;20;25;31.5;40;50;63;80;100;
                      125;160;200;250;315;400;500;630;800;
                      1000;1250;1600;2000;2500;3150;4000;5000;
                      6300;8000;10000;12500;16000];
% Central frequency of 1/1 Octave Bands
n2 = length(Octave_Bands_Third);
for j = 1:n2
    if SPL_Octave_Band_Third(j)<0
       SPL_Octave_Band_Third(j) = 0;
    end
end
% subplot(2,1,2)
bar(categorical(Octave_Bands_Third),SPL_Octave_Band_Third,'g');
title('1/3 Octave Bands')
xlabel('Central Frequency(Hz)');
ylabel('SPL(dB)');
% Bar Graph for easy representation of 1/3 octave bands
