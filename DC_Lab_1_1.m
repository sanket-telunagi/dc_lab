clc ;
close all ;
clear all ;

pkg load statistics ;  # loading package 

x = -5 : 0.01 : 5 ;
y = normpdf(x,0,1) ;
subplot(131);
plot(x,y) ;
axis([-4 4 -0.01 0.5]) ;
title("mean = 0 & std = 1");

y = normpdf(x,0,0.5) ;
subplot(132);
plot(x,y) ;
axis([-4 4 -0.01 0.9]) ;
title("mean = 0 & std = 0.5");

y = normpdf(x,1,1) ;
subplot(133);
plot(x,y) ;
axis([-5 5 -0.01 0.5]) ;
title("mean = 1 & std = 1");