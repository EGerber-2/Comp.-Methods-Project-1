clc
clear
close all

%{
data = readmatrix('sample_thrust_data.csv'); %all data from the calibration data set, 3:N
time = data(:,1); % separating time column 
channel_data = data(:,2:3); %separating thrust data
data(data(:,2) == 0 , :) = []; % gettinge rid of values equal to zero from channel columns
ch_0 = data(:,2);
ch_1 = data(:,3);
max_time = max(time);
%time(time < 5 , :) = []; % gettinge rid of values less than 5
%}

data = readmatrix('Static Test Stand Calibration Case 1.xlsx');
load = data(:,1);
ch_0 = data(:,4); %technically all y coordinates for channel 0
ch_1 = data(:,5); % technically all y coordinates for channel 1

figure (1)
scatter(load,ch_0);
title('Force vs. Voltage Channel 1')
xlabel('Force (lb)')
ylabel("Voltage (mV)")

N_0 = data(:,4); % N for channel 0
x = data(:,1);% x for both channels
delta_0 = length(x)*sum(x.^2)-(sum(x)).^2;
Asum_0 = ((sum(x.^2))*sum(ch_0) - sum(x)*sum(x.*ch_0))/delta_0;
Bsum_0 = (length(x)*sum(x.*ch_0)-sum(x)*sum(ch_0))/delta_0;
yfit_0 = Bsum_0 *x + Asum_0;
hold on;
plot(x,yfit_0);

figure(2)
scatter(load,ch_1);
title('Force vs. Voltage Channel 2')
xlabel('Force (lb)')
ylabel("Voltage (mV)")

N_1 = data(:,5); % N for channel 0
x = data(:,1);% x for both cahnnels
delta_1 = length(x)*sum(x.^2)-(sum(x)).^2;
Asum_1 = ((sum(x.^2))*sum(ch_1) - sum(x)*sum(x.*ch_1))/delta_1;
Bsum_1 = (length(x)*sum(x.*ch_1)-sum(x)*sum(ch_1))/delta_1;
yfit_1 = Bsum_1 *x + Asum_1;
hold on;
plot(x,yfit_1);