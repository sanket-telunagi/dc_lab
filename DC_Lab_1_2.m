close all ;
clear all ;
clc ;

# normal distribution -----
# normrnd(mean,std,row,columns)
# ifft(x,values to consider) 


# code to plot PSD
x = normrnd(0,1,1,800);
Gy = periodogram(x) ; # returns PSD of x
subplot(121);
grid on;
plot(Gy);
title("PSD");

# code to plot autocorrelation
t = -127 : 1 : 128 ;
Ry = abs(ifft(Gy,256));
Ry_matrix = [ Ry(130:256)' Ry(1:129)'] ;
subplot(122) ;
grid on ;
plot(t,Ry_matrix) ;
title("Autocorrelation Matrix") ;