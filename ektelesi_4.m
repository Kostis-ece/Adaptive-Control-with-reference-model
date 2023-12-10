%% clear everything
clc;
close all;
clear all;


%% 1ο Σενάριο

Ts = [0,12] ;
%r = @(t)(0); %1o Σενάριο
r = @(t)(0.00437*(3.5*sin(0.5*t)+3*cos(0.5*t)));  %2ο Σενάριο (α)
 lam = 2.9; 
    g1 = 8000000000;  
    g2 = 2000000000;
    g3 = 6000000000;
    g4 = 5000000000;
        
theta_star = [2-lam;-lam^2/2 + 12*lam-20 ; 7+lam/2  ; 1] ; 
xo = [0; 0 ; 0 ; 0 ; 0; 0; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0] ;
[T,X] = ode45(@(t,x)symperifora_4(t,x,r),Ts,xo);
e = X(:,1) - X(:,5) ;  % σφάλμα εξόδου 
E = X(:,2) - X(:,6) ;  % σφάλμα ταχύτητας
U = X(:,7).*X(:,3) + X(:,8).*X(:,4) + X(:,9).*X(:,1) + X(:,10).*r(T) - e.*(g1*X(:,11).*X(:,11) + g2*X(:,12).*X(:,12) + g3*X(:,13).*X(:,13) + g4*X(:,14).*X(:,14));
thetatilda1 = X(:,7) - theta_star(1,:);
thetatilda2 = X(:,8) - theta_star(2,:);
thetatilda3 = X(:,9) - theta_star(3,:);
thetatilda4 = X(:,10) - theta_star(4,:);


%plot(T,thetatilda1);
%plot(T,thetatilda2);
%plot(T,thetatilda3);
%plot(T,thetatilda4);
%plot(T,U);
plot(T,X(:,1), 'r' , T, X(:,5), 'b' , T,e , 'y' );
%plot(T,X(:,2), 'r' , T, X(:,6), 'b' , T,E, 'y' );