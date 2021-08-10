% PROJECT
% SPECTRUM COMPARISION
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
figure(1)
%subplot(2,2,2)
plot(f,P)
hold on
xlabel('Frequency(Hz)');
ylabel('Pressure(Pa)');
title('Pressure v/s Frequency Plot')



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
ffty1      = fft(z1);
P2         = abs(ffty1/L);
P1         = 2*P2;
P          = P2(1:L/2+1);
P(2:end-1) = 2*P(2:end-1);
f = fs*(0:(L/2))/L;
% figure(1)
%subplot(2,2,2)
plot(f,P)
xlabel('Frequency(Hz)');
ylabel('Pressure(Pa)');
title('Pressure v/s Frequency Plot')
legend('Before treatment','After treatment')