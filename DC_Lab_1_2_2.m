clc ;
close all ;
clear all  ;
pkg load statistics ;

y = normrnd(0,1,1,200) ;
Ry = abs(fft(y,256)) ;
Ry_matrix = [Ry(128:256)' Ry(1:129)'] ;
display(Ry_matrix);
t = -127:1:128 ;
subplot(131);
plot(Ry_matrix) ;

subplot(132);
Gy = periodogram(y) ;
plot(Gy);

subplot(133);
auto = abs(ifft(Gy,256)) ;
auto_mat = [auto(130:256)' auto(1:129)'] ;
plot(t,auto_mat,"green") ;